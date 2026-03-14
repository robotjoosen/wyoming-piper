#!/usr/bin/env bash
cd /app

args=(
    --uri 'tcp://0.0.0.0:10200'
    --data-dir /app/data
    --download-dir /app/data
)

if [ -n "$VOICE" ]; then
    args+=(--voice "$VOICE")
fi

if [ "$USE_CUDA" = "1" ]; then
    args+=(--use-cuda)
fi

if [ "$NO_STREAMING" = "1" ]; then
    args+=(--no-streaming)
fi

if [ "$AUTO_PUNCTUATION" = "1" ]; then
    args+=(--auto-punctuation)
fi

if [ "$UPDATE_VOICES" = "1" ]; then
    args+=(--update-voices)
fi

if [ -n "$SPEAKER" ]; then
    args+=(--speaker "$SPEAKER")
fi

if [ -n "$NOISE_SCALE" ]; then
    args+=(--noise-scale "$NOISE_SCALE")
fi

if [ -n "$LENGTH_SCALE" ]; then
    args+=(--length-scale "$LENGTH_SCALE")
fi

if [ -n "$NOISE_W_SCALE" ]; then
    args+=(--noise-w-scale "$NOISE_W_SCALE")
fi

if [ -n "$SAMPLES_PER_CHUNK" ]; then
    args+=(--samples-per-chunk "$SAMPLES_PER_CHUNK")
fi

exec .venv/bin/python3 -m wyoming_piper "${args[@]}" "$@"