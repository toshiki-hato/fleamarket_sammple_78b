class LeadTime < ActiveHash::Base
  self.data = [
      {id: 0, name: '選択してください'},
      {id: '1日~2日で発送', name: '1日~2日で発送'}, {id: '2日~3日で発送', name: '2日~3日で発送'}, {id: '4日~7日で発送', name: '4日~7日で発送'}
  ]
end