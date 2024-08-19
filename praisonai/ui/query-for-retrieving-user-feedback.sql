SELECT
    f.id AS feedback_id,
    f.forId AS feedback_forId,
    f.value AS feedback_value,
    f.comment AS feedback_comment,
    s.id AS step_id,
    s.name AS step_name,
    s.type AS step_type,
    s.threadId AS step_threadId,
    s.input AS step_input,
    s.output AS step_output,
    s.createdAt AS step_createdAt,
    s.parentId AS step_parentId,
    'user_query' AS query_or_response
FROM
    feedbacks f
JOIN
    steps s
ON
    f.forId = s.parentId
WHERE
    s.parentId IN (SELECT forId from feedbacks)

UNION ALL

SELECT
    f.id AS feedback_id,
    f.forId AS feedback_forId,
    f.value AS feedback_value,
    f.comment AS feedback_comment,
    s.id AS step_id,
    s.name AS step_name,
    s.type AS step_type,
    s.threadId AS step_threadId,
    s.input AS step_input,
    s.output AS step_output,
    s.createdAt AS step_createdAt,
    NULL AS step_parentId,  -- This column does not exist in the second query's result set
    'response' AS query_or_response
FROM
    feedbacks f
JOIN
    steps s
ON
    f.forId = s.id
WHERE
    s.id IN (SELECT forId from feedbacks)

ORDER BY
    feedback_id, query_or_response;
