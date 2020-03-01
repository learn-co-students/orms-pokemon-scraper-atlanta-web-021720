class Pokemon
    attr_accessor :name, :type, :id, :db

    def initialize(id: , name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    # def self.new_from_db(row)
    #     pokemon = self.new(row[0],row[1],row[2],row[3])
    #   end

    def self.find(id,db)
        # sql = <<-SQL
        # SELECT * FROM pokemon WHERE id = id
        # SQL
    
        # DB[:conn].execute(sql).map do |row|
        #   self.new_from_db(row)
        # end

        # pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
        pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).first
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    end

    def self.save(name, type, db)
        # if self.id
        #     self.update
        # else
        # sql = <<-SQL
        #     INSERT INTO pokemon (name, type)
        #     VALUES (?, ?)
        # SQL
        # DB[:conn].execute(sql, name, type)
        # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
       # end
       db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end


    # def self.update
    #     sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
    #     DB[:conn].execute(sql, name, type, id)
    # end
end