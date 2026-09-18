package core_logger

import (
	"errors"
	"fmt"
	"os"

	"go.uber.org/zap"
)

type Logger struct {
	*zap.Logger

	file *os.File
}

func NewLogger(logLevel string, logFolder string) (*Logger, error) {
	zapLvl := zap.NewAtomicLevel()
	if err := zapLvl.UnmarshalText([]byte(logLevel)); err != nil {
		return nil, fmt.Errorf("unmarshal log level: %w", err)
	}

	if err := os.MkdirAll()
}
