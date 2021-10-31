module Types
    module Input
        class NoteInputType < Types::BaseInputObject
            # argument :id, ID
            argument :title, String, required: true
            argument :body, String, required: true
        end
    end
end  