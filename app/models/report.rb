class Report < ApplicationRecord
  # 通報者を示す関連付け
  belongs_to :reporter, class_name: "Customer", foreign_key: "reporter_id"
  # 通報対象を示す関連付け
  belongs_to :reported, class_name: "Customer", foreign_key: "reported_id"
  # 通報対象のコンテンツを示す多様性（Polymorphic）関連付け
  belongs_to :content, polymorphic: true

  # reporter_idがuser_idである通報の件数を返すクラスメソッド
  def self.reported_count(customer_id)
    where(reported_id: customer_id).count
  end

  def display_content_type
    if content_type == "Comment"
      "コメント"
    else
      content_type
    end
  end

  # 通報理由の列挙型（Enum）
  enum reason: {
    inappropriate_content: 0,     # 不適切なコンテンツ
    commercial_purposes: 1,       # 商業目的
    spam: 2,                      # スパム
    other: 3                      # その他
  }
   enum report_status: { unresolved: 0, pending: 1, resolved: 2 }
end
