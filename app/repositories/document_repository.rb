require "gds_api/content_store"

class DocumentRepository
  def fetch(base_path)
    document = fetch_content_item(base_path)

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
      content_store.content_item(base_path)
    rescue
      nil
    end
  end

  def content_store
    GdsApi::ContentStore.new(Plek.new.find("content-store"))
  end

  def extract_parent_base_path_from_document(document)
    if document.dig("details", "breadcrumbs").present?
      document.dig("details", "breadcrumbs").last["base_path"]
    else
      document.dig("details", "manual", "base_path")
    end
  end

  def fetch_parent_for_document(document)
    fetch_content_item(
      extract_parent_base_path_from_document(document)
    )
  end
end
