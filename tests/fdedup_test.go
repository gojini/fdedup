package fdedup_test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"gojini.dev/fdedup"
)

func TestTemplate(t *testing.T) {
	t.Parallel()

	assert := assert.New(t)
	assert.Equal(0, fdedup.Noop())
}
