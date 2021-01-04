## users テーブル

| Column | Type | Options |
| ---------- | -------- | -------- |
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| name | string | null: false |
| name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many : items
- has_many : items, through:
comments
- has_many :purchases


## items
| Column | Type | Options |
| ---------- | -------- | -------- |
| image | ActiveStorage | null: false|
| item_name| string | null: false |
| details | text | null: false |
| category | string | null: false |
| state | string | null: false |
| burden | string | null: false |
| area | string | null: false |
| days | string | null: false |
| price | string | null: false |
| user | references | null: false |


### Association
belongs_to :user
has_many :users, through:
comments
belongs_to :purchase

## commentsテーブル

|  Column | Type | Options |
| ------------ | ------- | ---------- |
| text      | text | null: false |
| user | references | null: false |
| item | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
<!-- - belongs_to :purchase 必要か不明 -->

## purchasesテーブル

|  Column | Type | Options |
| ------------ | ------- | ---------- |
| buyer | string | null: false |
| shipping_address | string | null: false |
| price| string | null: false |
| user | references | null: false |

### Association

- belongs_to :user
- has_many :items
- has_one :domicile
<!-- - has_many :comments 必要か不明-->

## domiciles
|  Column | Type | Options |
| ------------ | ------- |---------|
| postal_code | integer | null: false |
| prefectures | string | null: false |
| address | string | null: false |
|  building_name | string | null: true |
| phone_number | integer | null: false |
|  purchase | references | null: false |

### Association
- belongs_to :purchase

