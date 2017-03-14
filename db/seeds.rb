
post1 = Post.create(title: "Autos", body: "Clasicos")

tag1 = Tag.create(name: "mustang")
tag2 = Tag.create(name: "chalinger")
tag3 = Tag.create(name: "camaro")

ruta1 = PostTag.create(post_id: post1.id, tag_id: tag1.id)
ruta2 = PostTag.create(post_id: post1.id, tag_id: tag2.id)
ruta3 = PostTag.create(post_id: post1.id, tag_id: tag3.id)
