CREATE INDEX idx_person_name ON person ((UPPER(name)));
EXPLAIN ANALYZE
SELECT *
FROM person
    JOIN person_visits ON person.id = person_visits.person_id
WHERE UPPER(name) = 'KATE';