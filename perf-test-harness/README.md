# Performance Testing

| Note: This is Helm Wrapper chart for performance testing harness.

This chart includes the following components:
- Callback Simulator - a lightweight simulator that can be used to simulate DFSP callbacks.
- K6 Load Generator - a tool that can be used to generate load.

## Pre-requisites

- An existing Mojaloop deployment (Note: this test harness assumes mojaloop is deployed in the `demo` namespace).
- Helm 3.x

## Setup

Run `helm dep up .` to update the dependencies.

## Installation

```bash
helm -n demo install perf .
```

## Testing

To run performance tests including provisioning TTK collection
```bash
helm -n demo test perf
```

To run only performance tests
```bash
helm -n demo test perf --filter "name=perf-k6-tests"
```

