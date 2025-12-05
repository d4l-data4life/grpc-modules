package connection

import (
	"context"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"

	"github.com/d4l-data4life/go-svc/pkg/logging"
	"github.com/d4l-data4life/grpc-modules/pkg/utils/auth"
)

func OpenWithSecretAuth(runCtx context.Context, url, secret string) (*grpc.ClientConn, error) {
	secretAuth := auth.SecretAuthCreds{Secret: secret}
	grpcConn, err := grpc.Dial(
		url,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
		grpc.WithPerRPCCredentials(secretAuth),
	)
	if err != nil {
		logging.LogErrorfCtx(runCtx, err, "could not establish grpc connection to %s", url)
		return nil, err
	}

	// Wait for context to be done to close connection
	go func() {
		<-runCtx.Done()
		grpcConn.Close()
	}()

	return grpcConn, nil
}
