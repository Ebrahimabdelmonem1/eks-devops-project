CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tasks (title)
SELECT 'Deploy application to EKS'
WHERE NOT EXISTS (
    SELECT 1 FROM tasks WHERE title = 'Deploy application to EKS'
);
