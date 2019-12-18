class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :story_id, :name, :description, :character_notes, :gallery, :appearances

  def character_notes
    self.object.character_notes.map do |character_note|
      {
        id: character_note.id,
        character_id: character_note.character_id,
        text: character_note.text
      }
    end
  end

  def gallery
    {
      id: self.object.gallery.id,
      character_id: self.object.gallery.character_id,
      images: self.object.gallery.images
  }
  end

  def appearances
    self.object.appearances.map do |appearance|
      {
        id: appearance.id,
        scene_id: appearance.scene_id,
        character_id: appearance.character_id,
        appearance_notes: appearance.appearance_notes
      }
    end
  end
end
