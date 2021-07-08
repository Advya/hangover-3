class Game
    def initialize(word)
        @letters = get_letters(word)
        @errors = 0
        @good_letters = []
        @bad_letters = []
        @status = 0
    end
    def get_letters(word)
        if word == nil || word == ''
            abort "Загадано пустое слово."
        end
        return word.split('')
    end
    def status
        return @status
    end
    def next_step(letter)
        if @status == -1 || @status == 1
            return
        end
        if @good_letters.include?(letter) || @bad_letters.include?(letter)
            return
        end
        if @letters.include?(letter)
            @good_letters << letter
            if @good_letters.uniq.sort == @letters.uniq.sort
                @status = 1
            end
        else
            @bad_letters << letter
            @errors += 1
            if @errors >= 7 
                @status = -1
            end
        end
    end
    def ask_next_step
        puts "Введите следующую букву"
        letter =''
        while letter == ''
            letter = STDIN.gets.chomp
        end
        next_step(letter)
    end
    def errors 
        @errors
    end
    def letters
        @letters
    end
    def good_letters
        @good_letters
    end
    def bad_letters
        @bad_letters
    end
end