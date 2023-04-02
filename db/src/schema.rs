// @generated automatically by Diesel CLI.

diesel::table! {
    posts (id) {
        id -> Int4,
        title -> Varchar,
        body -> Text,
        published -> Bool,
        user_name -> Nullable<Text>,
        updated_at -> Nullable<Timestamp>,
    }
}
