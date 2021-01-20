## users テーブル

| Column | Type | Options |
| ---------- | -------- | -------- |
| nickname | string | null: false |
| email | string | null: false | unique: true |
| encrypted_password | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false|
| last_kana | string | null: false |
| first_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many : items
- has_many :purchases


## items
| Column | Type | Options |
| ---------- | -------- | -------- |
| item_name| string | null: false |
| details | text | null: false |
| category_id | integer | null: false |
| state_id | integer | null: false |
| burden_id | integer | null: false |
| area_id | integer | null: false |
| day_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false |


### Association
belongs_to :user
has_one :purchase

## commentsテーブル

|  Column | Type | Options |
| ------------ | ------- | ---------- |
| text      | text | null: false |
| user | references | null: false |
| item | references | null: false |

### Association

- belongs_to :user
- belongs_to :item


## purchasesテーブル

|  Column | Type | Options |
| ------------ | ------- | ---------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :domicile

## domiciles
|  Column | Type | Options |
| ------------ | ------- |---------|
| postal_code | string | null: false |
| area_id | integer | null: false |
| municipality | string | null: false |
| address | string | null: false |
|  building_name | string | ----- |
| phone_number | string | null: false |
|  purchase | references | null: false |

### Association
- belongs_to :purchase

