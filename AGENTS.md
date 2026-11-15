# Engineering baseline — capacity, reliability and cost

These rules apply to changes in this repository. They supplement, and never override, more specific project, legal, operational, or maintainer instructions.

## Before changing code
- Read this file, the README, relevant architecture/design docs, and the instructions in the affected directories.
- Identify the actual stack, supported runtime/compiler versions, default branch, release process, persistence, external services, and test commands. Do not infer them from another repository.
- Preserve existing behavior, public APIs, file formats, database schemas, hardware contracts, and compatibility unless the task explicitly requires a change.
- Before each write, re-read the current branch head and target file. Reconcile concurrent changes; never overwrite from a stale copy.
- Make the smallest coherent change. Do not create branches, pull requests, deploy, publish releases, or change repository settings unless the repository's own policy and the task explicitly authorize it.

## Capacity and cost before adding dependencies
- Inventory the actual provider, plan, quotas, rate limits, concurrency, CPU/memory, storage, payload limits, retention, and billing conditions before adopting a service or dependency.
- Prefer a zero-cost design when it meets the requirement. Do not enable billing, paid tiers, trials, paid runners, or paid APIs without explicit approval. If the required capacity cannot fit the approved budget, document the mismatch and alternatives before implementation.
- Estimate workload by operations per request/event/device/account and include peak bursts, scheduled work, retries, duplicate events, and integrations. Record assumptions; do not claim a user-count capacity without representative measurements.
- Separate current state, durable history, queues/events, cache, indexes, and audit records. Avoid high-frequency read-modify-write of growing documents or arrays where append, batching, aggregation, or a suitable store is more appropriate.
- Keep provider-specific code behind adapters where practical. Preserve portability and do not introduce cloud lock-in accidentally.

## Reliability and multi-user isolation
- Define bounded timeouts, rate limits, backpressure, and behavior for throttling (including HTTP 429), timeouts, partial failure, and provider outages.
- Use idempotency and deduplication where retries or repeated delivery can occur. Retries must be bounded and use backoff with jitter; provide recovery/dead-letter handling when appropriate.
- Do not claim exactly-once delivery or atomic claiming unless the storage/coordination primitive actually guarantees it under concurrency.
- Isolate quotas and data by tenant/account/device where applicable. A global provider quota is not a per-user product limit.
- Do not silently discard accepted data during overload or degraded operation.

## Observability, privacy and validation
- Measure operations, latency, errors, backlog, retries, and quota consumption at the relevant boundary. Minimize personal data in metrics and logs.
- Test normal, duplicate, concurrent, burst, timeout, throttling, partial-failure, retry, recovery, and tenant-isolation paths where relevant.
- Run write/load tests only against isolated test resources or complete mocks; never use production data or production storage for destructive tests.
- Report separately what was inspected, changed, tested, passed, and deployed. A test not run is "not verified", not passed or failed. A commit does not prove deployment.
- Before migrations or provider changes, document compatibility, data mapping, backup, rollback, retention, export, and deletion implications.

## Delivery
- Preserve the repository's own branch, CI, release, licensing, and deployment conventions.
- Do not add a dependency or paid service merely for convenience. Update documentation and tests when behavior, contracts, resource use, or operational requirements change.
- Review the final diff for regressions, accidental secrets, generated artifacts, data loss, and unrequested changes.
