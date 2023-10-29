class CreateReservationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_requests do |t|
      t.references :hotel, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :user, foreign_key: true # ユーザーとの関連付けを追加
      t.date :day
      t.integer :number_of_people
      t.boolean :is_smoking
      t.string :food
      t.string :course
      t.text :memo
      t.boolean :status
      t.integer :reservation_number

      t.timestamps
    end
  end
end
