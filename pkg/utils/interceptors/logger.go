package interceptors

import (
	"context"
	"encoding/json"

	"github.com/gesundheitscloud/go-svc/pkg/logging"

	"google.golang.org/grpc"
)

func NewLogger(excludePatterns []string) grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req any, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp any, err error) {
		// Bypass logs for excluded paths
		for _, pattern := range excludePatterns {
			if pattern == info.FullMethod {
				return handler(ctx, req)
			}
		}

		reqJSON, err := json.Marshal(req)
		if err != nil {
			logging.LogWarningfCtx(ctx, err, "failed marshalling incoming request")
		}
		logging.LogInfofCtx(ctx, "[IN] %s - %s", info.FullMethod, reqJSON)

		resp, err = handler(ctx, req)
		if err != nil {
			logging.LogErrorfCtx(ctx, err, "[OUT] %s", info.FullMethod)
		} else {
			logging.LogInfofCtx(ctx, "[OUT] %s", info.FullMethod)
		}

		return
	}
}
