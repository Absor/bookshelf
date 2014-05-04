FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'testtest1'
  end

  factory :shelf, aliases: [:bookshelf] do
    user

    factory :shelf_with_books, aliases: [:bookshelf_with_books] do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        book_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |shelf, evaluator|
        evaluator.book_count.times do
          book = create(:book)
          shelf.books << book
        end
      end
    end
  end

  factory :book do
  end
end