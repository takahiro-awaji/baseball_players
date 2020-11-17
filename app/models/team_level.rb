class TeamLevel < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '全国大会常連レベル' },
    { id: 2, name: '都道府県大会上位レベル' },
    { id: 3, name: '都道府県大会出場レベル' },
    { id: 4, name: '地区大会上位レベル' },
    { id: 5, name: '地区大会出場レベル' },
    { id: 6, name: '大会には出場していない' },
    { id: 7, name: 'わからない' }
  ]
end
