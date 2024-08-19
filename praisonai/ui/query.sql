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
    s.parentId AS step_parentId
FROM
    feedbacks f
JOIN
    steps s
ON
    f.forId = s.parentId
WHERE
    s.parentId IN (
        '7d9ae58d-7f99-4c16-bba2-ccc6601eacce',
        'ac4bd22c-252b-444a-831d-be7a48b45228',
        'acdbb3c0-8279-4f1f-94d5-c9245760dba8'
    );
