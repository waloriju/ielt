atom_feed do |feed|
  feed.title("Igreja evangélica livre de Toledo")
  feed.updated(@noticias[0].created_at) if @noticias.length > 0

  @noticias.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.titulo)
      entry.content(post.conteudo, :type => 'html')

      entry.author do |author|
        author.name("IELT")
      end
    end
  end
end