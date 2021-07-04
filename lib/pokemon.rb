class Pokemon
    attr_reader :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @name = name
        @id = id
        @type = type
        @db = db
    end
    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end
    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE pokemon.id = ?
        SQL
        pokemon = db.execute(sql, id).flatten
        self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    end
end
