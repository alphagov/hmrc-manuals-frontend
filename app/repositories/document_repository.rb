class DocumentRepository
  def fetch(document)
    if document
      parent = fetch_parent_for_document(document)

      SiblingDecorator.new(
        document: document,
        parent: parent,
      )
    end
  end

private

  def fetch_content_item(base_path)
    begin
      Services.content_store.content_item(base_path)
    rescue GdsApi::ContentStore::ItemNotFound
      nil
    end
  end

  def extract_parent_base_path_from_document(document)
    if document.dig("details", "breadcrumbs").present?
      document.dig("details", "breadcrumbs").last["base_path"]
    else
      document.dig("details", "manual", "base_path")
    end
  end

  def fetch_parent_for_document(document)
    parent = extract_parent_base_path_from_document(document)
    fetch_content_item(parent) if parent
  end
end
