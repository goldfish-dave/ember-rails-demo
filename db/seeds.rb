p1 = Post.create(title: 'Hello', body: 'world')
p2 = Post.create(title: 'foo', body: 'bar')

p1.comments.create(body: 'wheeeee')
p1.comments.create(body: 'wooooooooot')

p2.comments.create(body: 'ham')
p2.comments.create(body: 'spam')