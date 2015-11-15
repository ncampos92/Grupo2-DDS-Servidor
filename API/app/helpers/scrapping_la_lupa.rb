require 'mechanize'

module ScrappingLaLupa

  def get_proposals
    @mechanize = Mechanize.new
    page = @mechanize.get('http://www.lalupadelaconstitucion.cl/participa/tu-propuesta/')
    links = page.search(".item-body").search("a").map { |link| link['href'] }
    @pages = ""
    links.each do |link|
      get_porposal(link)
    end
  end

  def get_porposal(link)
    @mechanize = Mechanize.new
    proposal_page = @mechanize.get(link)
    author = proposal_page.search(".TwitterCard-header-name").text
    title = proposal_page.search(".TwitterCard-body").search(".TwitterCard-body-title").text
    content = proposal_page.search(".TwitterCard-body").search("p").text
    save_proposal(author, title, content)
  end

  def save_proposal(author, title, content)
    user = User.find_by(email:"scrapping@lalupadelaconstitucion.cl")
    if (user == nil)
      return
    end
    proposal = Proposal.find_by(texto: content)
    if (proposal == nil)
      Proposal.create(user_id: user.id, titulo: title, texto: content)
    end
  end
end
