class ActivityPace < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '週3回以上' },
    { id: 2, name: '週2回' },
    { id: 3, name: '週1回' },
    { id: 4, name: '月2回' },
    { id: 5, name: '月1回' },
    { id: 6, name: '不定期' }
  ]
end
