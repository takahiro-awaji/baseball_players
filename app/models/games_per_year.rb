class GamesPerYear < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '50回以上' },
    { id: 2, name: '30回以上' },
    { id: 3, name: '10回以上' },
    { id: 4, name: '5回以上' },
    { id: 5, name: '5回未満' }
  ]
end
