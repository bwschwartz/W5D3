PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE replies;
DROP TABLE users;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

INSERT INTO
  users (fname, lname)
VALUES
  ('John', 'Smith'),
  ('Elon', 'Musk'),
  ('Elton', 'John');

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER,

  FOREIGN KEY(author_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('WTF', 'are you for real', (SElECT id FROM users WHERE fname = 'Elon')),
  ('help??', 'pls', (SElECT id FROM users WHERE fname = 'Elton'));

CREATE TABLE question_follows ( --join table
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);


INSERT INTO
  question_follows (questions_id, users_id)
VALUES
  ((SElECT id FROM questions WHERE title = 'WTF'), (SElECT id FROM users WHERE fname = 'Elon')),
  ((SElECT id FROM questions WHERE title = 'help??'), (SElECT id FROM users WHERE fname = 'Elton'));



CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_question TEXT NOT NULL,
  body TEXT NOT NULL,
  parent_reply TEXT,
  users_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,

  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(parent_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);







