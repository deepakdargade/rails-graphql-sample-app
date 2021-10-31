module Mutations
    class UpdateNote < Mutations::BaseMutation
        argument :id, ID, required: true
        argument :params, Types::Input::NoteInputType, required: true

        field :note, Types::NoteType, null: false

        def resolve(id:, params:)
            note = Note.find(id)
            note_params = Hash params

            begin
                note.update(note_params)
                { note: note }
            rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                " #{e.record.errors.full_messages.join(', ')}")
            end
        end
    end
end
