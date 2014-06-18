class ChangeNotesPresenter

  delegate :title, :slug, to: :change_notes

  def initialize(change_notes)
    @change_notes = change_notes
  end

  def manual
    change_notes.manual_artefact
  end

  def updates
    change_notes.details.updates.map { |u|
      UpdatePresenter.new(u)
    }
  end

  def by_year
    group_updates_by_year(updates)
  end

private
  attr_reader :change_notes

  def group_updates_by_year(updates)
    updates.group_by { |update| update.updated_at.year }.map { |year, updates|
      [year, group_updates_by_day(updates)]
    }
  end

  def group_updates_by_day(updates)
    updates.group_by(&:updated_at).map { |day, updates|
      [day, group_updates_by_document(updates)]
    }
  end

  def group_updates_by_document(updates)
    updates.group_by(&:slug).map { |_, updates|
      DocumentUpdatesPresenter.new(updates)
    }
  end

  class UpdatePresenter
    delegate :slug, :change_note, :title, to: :update

    def initialize(update)
      @update = update
    end

    def updated_at
      @updated_at ||= Time.parse(update.published_at).to_date
    end

  private
    attr_reader :update
  end

  class DocumentUpdatesPresenter
    delegate :slug, :title, to: :'updates.first'

    def initialize(updates)
      @updates = updates
    end

    def change_notes
      updates.map(&:change_note)
    end

    def path
      "/#{slug}"
    end

  private
    attr_reader :updates
  end
end
