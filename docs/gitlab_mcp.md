MCP + GitLab keyword search

Relevance: Best for exact code lookups (identifiers, file paths, error codes). Weak when users ask in natural language or don’t know the right terms.

Implementation effort: Low (already in GitLab + MCP).

Operational overhead: Low (no extra pipelines/index).

Cost: Mostly whatever you already pay for GitLab.

MCP + Azure AI Search (semantic / hybrid)

Relevance: Much better for docs/issues/epics/ADRs/runbooks/templates and “how do we…?” queries. Hybrid keeps keyword precision while adding semantic recall.

Implementation effort: Medium–high (ingestion + chunking + embeddings + permission trimming + sync).

Operational overhead: Medium–high (run search service + monitor pipelines + index lifecycle + tuning/eval).

Cost: Higher (search capacity + optional semantic ranker + embeddings compute; embeddings often the biggest driver).

Side-by-side: GitLab MCP keyword search vs Azure AI Search semantic/hybrid
Relevance / quality of results

GitLab MCP + keyword search

Pros

Very high precision when the user (or the assistant) knows the right terms: class names, error codes, file paths, config keys.

Natural fit for code search patterns (exact match, regex, etc.). GitLab’s “exact code search” is built on Zoekt and supports exact/regex modes.

No “semantic surprise” results—less chance of pulling conceptually-related-but-wrong snippets.

Cons

Falls down when users ask in natural language: “How do we deploy service X?”, “What’s our standard Terraform pattern for Y?”, “What’s the rollback process?”

The assistant has to guess keywords; when it guesses wrong, recall collapses.

Azure AI Search semantic / hybrid

Pros

Much better recall for natural language, synonyms, and “I don’t know the magic words” queries.

Hybrid queries run full-text + vector in parallel and merge results using Reciprocal Rank Fusion (RRF), which often gives “best of both worlds” behavior.

Optional semantic ranker can re-rank the top results to better match intent (especially for prose). It can also generate captions/answers extracted from your content.

Cons

Semantic ranker is explicitly most beneficial on information-rich prose; it’s not a magic fix for code.

You’ll still want keyword/exact matching for identifiers and precise strings (hybrid helps, but doesn’t eliminate this need).

Practical takeaway: Azure AI Search is most “worth it” when your assistant frequently needs to retrieve docs/issues/decisions/templates across many repos and teams. For pure code search, GitLab’s exact/advanced search often remains the workhorse.



Development Plan:

Implementation effort

GitLab MCP + keyword search

Mostly “already done.” GitLab MCP server is designed to securely connect AI tools to GitLab data and operations.

Effort goes into prompting + query strategy (query rewriting, multiple passes, filtering by project/group, etc.), not infra.

Azure AI Search semantic/hybrid
You’re signing up for a real retrieval platform project:

Ingestion + sync: pull repos/issues/epics/wiki/markdown, handle incremental updates (webhooks or scheduled jobs), deletes, renames, branch strategy.

Chunking strategy: code vs docs vs issues behave differently; chunk size and metadata matter a lot.

Embeddings pipeline: pick model, batch, retry, rate limits; store vectors.

Security trimming: replicate GitLab permissions into the index (group/project membership, confidential issues, etc.).

Schema + ranking tuning: fields, analyzers, boosts, filters, recency weighting.

Azure AI Search does provide first-class support for vector + hybrid retrieval, and a fairly rich feature set for RAG-style retrieval apps.

1. Event-Driven Sync (Webhooks): Configure GitLab System Hooks or Project Webhooks. When a push, issue, or merge_request event occurs, GitLab sends a JSON payload to an Azure Function.

2. The Orchestrator (Azure Function):

  On Create/Update: Triggers your ingestion logic (fetch file content → chunk → embed → upsert to Azure).

  On Delete: Removes the specific document ID from the Azure Index.

3. Scheduled "Deep Crawl" (Reliability): A weekly scheduled task to compare the GitLab repository state with the Azure Index to fix any missed webhook events (drift).
4. Security & Permissions
5. Index Schema Enhancements
6. Integration & Deployment


key word search with+query re-writing
