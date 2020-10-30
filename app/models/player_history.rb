class PlayerHistory < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }, 
    { id: 1, name: 'バラバラ' }, 
    { id: 2, name: '未経験多数' }, 
    { id: 3, name: '小学生まで' }, 
    { id: 4, name: '中学生まで' }, 
    { id: 5, name: '高校生まで' }, 
    { id: 6, name: '大学生まで' }, 
    { id: 7, name: 'その他' }
  ]
end