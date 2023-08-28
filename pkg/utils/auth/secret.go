package auth

import (
	"context"
	"fmt"
)

// SecretAuthCreds is an implementation of credentials.PerRPCCredentials for service secret authentication
type SecretAuthCreds struct {
	Secret string
}

func (s SecretAuthCreds) GetRequestMetadata(context.Context, ...string) (map[string]string, error) {
	return map[string]string{
		"authorization": fmt.Sprintf("BEARER %s", s.Secret),
	}, nil
}

func (s SecretAuthCreds) RequireTransportSecurity() bool {
	return false
}
