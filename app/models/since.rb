class Since < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '結成1年未満' },
    { id: 2, name: '結成1年〜3年未満' },
    { id: 3, name: '結成3年〜5年未満' },
    { id: 4, name: '結成5年〜7年未満' },
    { id: 5, name: '結成7年~10年未満' },
    { id: 6, name: '結成10年~15年未満' },
    { id: 7, name: '結成15年~20年未満' },
    { id: 8, name: '結成20年~25年未満' },
    { id: 9, name: '結成25年~30年未満' },
    { id: 10, name: '結成30年~35年未満' },
    { id: 11, name: '結成35年以上' },
    { id: 12, name: 'わからない' }
  ]
end
