CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  body TEXT NOT NULL,
  published BOOLEAN NOT NULL DEFAULT FALSE,
  user_name TEXT,
  updated_at timestamptz
);

CREATE FUNCTION posts_stamp() RETURNS trigger AS $posts_stamp$
    BEGIN
        IF NEW.title IS NULL THEN
            RAISE EXCEPTION 'title cannot be null';
        END IF;
        NEW.updated_at := current_timestampt;
        NEW.user_name := current_user;
        RETURN NEW;
    END;

$posts_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER posts_stamp BEFORE INSERT OR UPDATE ON posts
    FOR EACH ROW EXECUTE FUNCTION posts_stamp();