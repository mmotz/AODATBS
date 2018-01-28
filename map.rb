# map, with rooms and connections between them
module Map
  # define the room class
  class Room
    def initialize(name, description)
      @name = name
      @description = description
      @paths = {}
    end

    # these make it easy for you to access the variables
    attr_reader :name
    attr_reader :paths
    attr_reader :description

    def go(direction)
      return @paths[direction]
    end

    def add_paths(paths)
      @paths.update(paths)
    end
  end

  # descriptions for rooms
  # long line rubocop yelling ahoy!
  CENTRAL_CORRIDOR = Room.new('START',
                              """
    An Ordinary Day at the Browning School Part 1
    By Maximilian Motz
    
    DISCLAIMER: Every character in this game is NOT a real person at Browning in order for me to avoid conflict.
    If you think you weren't accurately portrayed in this game, your wrong cuz its NOT YOU!
    BTW the player is YOU, not the fictional version of me or otherwise
    
    You awaken
    Lucky you, its panther day (this is fiction btw) at Browning and you have no classes!
    Don't get the wrong idea though, your momma's still gonna make you go to school...
    
    Type anything to continue
                              """)

  SHOOT = Room.new('Death', 'You shoot and miss. He shoots you and you die.')

  DODGE_DEATH = Room.new('Death', 'You try to dodge. He shoots you and you die.')

  BEDROOM = Room.new('bedroom',
                                 """
    Your in your room, what do you do:
    1. Get dressed
    2. Go back to Sleep
    3. Go to the Bathroom
    4. Go to the Diningroom
    5. Leave the Building
    Answer should be given as number of choice
                                 """)
                            
   DRESSED = Room.new('getting dressed',
                              """
      What do you want to wear?
      1. Something Plain
      2. Something swanky
      3. A sweatshirt
                              """)
        
    DRESSED1 = Room.new('normal clothes',
                              """
    You choose a white shirt and a red tie.
    
    Type anything to continue
                              """)
    DRESSED2 = Room.new('groovy clothes~',
                              """
    You choose a bright purple shirt and a bright green sparkly bow tie.
    
    Type anything to continue
                              """)
                            
    DRESSED3 = Room.new('total rebel',
                              """
    You put on a red sweatshirt with the Browning logo on it
    
    Type anything to continue
                              """)
                              
    SLEEPWIN = Room.new('sleep ending',
                              """
    You decide to go back to bed cuz this day is a waste of your time.
    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz..........
    z?
    You sleep through the whole day and that was that
    YOU WIN! CONGRATULATIONS
                              """)
                              
   BATHROOM = Room.new('bathroom',
                              """
    Would you like to:
    1. Brush your teeth
    2. Take a Shower
    3. Go to the toilet
    4. leave
                              """)
                              
    BATHROOM1 = Room.new('brushy brushy',
                              """
    clean and white and very nice
    
    Type anything to continue
                              """)
    
    BATHROOM2 = Room.new('nice and clean :)',
                              """
    Your squeaky clean now
    
    Type anything to continue
                              """)
    
    BATHROOM3 = Room.new('all done',
                              """
    Kek, you did your business
    
    Type anything to continue
                              """)
    
    DROOM = Room.new('dining room',
                        """
    What would you like to eat?
    1. Milk and cereal
    2. Cereal and milk
    3. Waffles
    4. a singular whole banana
    5. Omlette
    6. Leave
                        """)
    
    DROOM125 = Room.new('YUM',
                        """
    OMNOMNOM
                        
    Type anything to continue
                        """)
    
    DROOM3 = Room.new('old reference...',
                        """
    DO YOU LIKE WAFFLES?
    YEAH WE LIKE WAFFLES!
                        
    Type anything to continue
                        """)
                        
    DROOMDEATH = Room.new('Death', 'You *accidentally* put the whole banana in your throat and choke and die.')

    SPACE = Room.new('spatial distortion',
                        """
    You start walking to school, but realize
    That space and time have fallen appart
    Instead of the world being how you once knew it to be
    It is shreded into billions of different pieces
      
    You are on a platform of land with your house
    There are other platforms around, as well as an abyss below you
    Do you:
    1. Jump one by one to each platform, attempting to get to school
    2. Jump into the void
    3. Go inside and call it a sick day
    
                        """)
    
    SPACE1 = Room.new('distortion spatial',
                        """
    You sucessfully jump to the next platform
    And the next one
    And th- WAIT
    There are three hooded figures standing on the platform in front of you
    They don't seem to notice you as they are hudled together
    
    Type anything to continue
                        """)
    
    SPACEDEATH = Room.new('Death', 'You died, what didja think would happen?')
    
    SPACEWIN = Room.new('space ENDING',
                        """
    You go inside, as if nothing ever happened
    YOU WIN
                        """)
                        
    HUDDLE = Room.new('more spatial distortion',
                        """
    What will you do to with these hoodlums:
    1. Fight them
    2. Converse with them
    3. Eavesdrop on their conversation
    4. Ignore them
                        """)
                        
    HUDDLEDEATH = Room.new('Death', 'You throw a punch at the closest one
    You sucessfull hit him, however his friend takes out
    A shotgun blows your head off')
                        
    HUDDLE2 = Room.new('eavesdropping',
                        """
    You say hi and introduce yourself
    They all turn around to look at you, then
    They all scatter out of there
    Oh well, you continue toward the school
      
    Type anything to continue
                        """)
    
    HUDDLE3 = Room.new('greeting the strangers',
                        """
      You sneak up to their huddle, close enough to hear their whispers
      'HAHAH, we actually DID IT, we destroyed space and time along with the Browning School'
      One of them says
      His friends cackle with him
      'I can't believe it was that EASY'
      The 2nd one scoffs
      'Yeah, not a single person tried to stop us'
      The 3rd one YAHOOs out of his mouth
      The 1st one starts doing a dance, but ends up noticing you,
      which causes him and the others to scatter
      You continue your journey toward the school
      
      Type anything to continue
                        """)
                        
    FINALE = Room.new('front of the school',
                        """
    You've arrived at the Browning school
    Or what's left of it, atleast...
    You see the head of the school, Dr. soul, weeping on the ground
    He Yells, 'THIS WASN'T SUPPOSED TO BE LIKE THIS,
    'O WHAT MISERY!'
    He scrambles up to you and grabs you by the collar hysterically
    'Your Browning, along with space and time's FINAL HOPE,' he blurts out
    'PLEASE, use this time machine and save my school'
    What do you do:
    1. Accept
    2. Decline
    3. Ask him why he cannot do it himself
                        """)
                        
    FINALY = Room.new('part 1 END',
                        """
    Before you could respond to his plight, he throws you into
    this time machine and you appear in front of the Browning school
    However, this seems like an actually ordinary day
    FIN PART 1
    THANK YOU FOR PLAYING
    PART 2 COMING EVENTUALLY ;)
                        """)
                              
 
  GENERIC_DEATH = Room.new('Death', 'You died.')

  # set the start
  START = CENTRAL_CORRIDOR

  # set up paths between rooms
  CENTRAL_CORRIDOR.add_paths('*' => BEDROOM)

  BEDROOM.add_paths('1' => DRESSED,
                    '2' => SLEEPWIN,
                    '3' => BATHROOM,
                    '4' => DROOM,
                    '5' => SPACE,
                    '*' => BEDROOM)

  DRESSED.add_paths('1' => DRESSED1,
                    '2' => DRESSED2,
                    '3' => DRESSED3,
                    '*' => BEDROOM)
  
  DRESSED1.add_paths('*' => BEDROOM)
  
  DRESSED2.add_paths('*' => BEDROOM)
  
  DRESSED3.add_paths('*' => BEDROOM)
  
  BATHROOM.add_paths('1' => BATHROOM1,
                    '2' =>  BATHROOM2,
                    '3' => BATHROOM3,
                    '4' => BEDROOM,
                    '*' => BATHROOM)
  
  BATHROOM1.add_paths('*' => BATHROOM)
  
  BATHROOM2.add_paths('*' => BATHROOM)
  
  BATHROOM3.add_paths('*' => BATHROOM)
  
  DROOM.add_paths('1' => DROOM125,
                    '2' => DROOM125,
                    '3' => DROOM3,
                    '4' => DROOMDEATH,
                    '5' => DROOM125,
                    '6' => BEDROOM,
                    '*' => DROOM)
  
  DROOM125.add_paths('*' => BEDROOM)
  
  DROOM3.add_paths('*' => BEDROOM)
  
  DRESSED3.add_paths('*' => BEDROOM)
  
  SPACE.add_paths('1' => SPACE1,
                    '2' => SPACEDEATH,
                    '3' => SPACEWIN,
                    '*' => SPACE)
  
  SPACE1.add_paths('*' => HUDDLE)
  
  HUDDLE.add_paths('1' => HUDDLEDEATH,
                    '2' => HUDDLE2,
                    '3' => HUDDLE3,
                    '4' => FINALE,
                    '*' => HUDDLE)
  
  HUDDLE2.add_paths('*' => FINALE)
  
  HUDDLE3.add_paths('*' => FINALE)
  
  FINALE.add_paths('*' => FINALY)
  
  # set up room names

  # A whitelist of allowed room names. We use this so that
  # bad people on the internet can't access random variables
  # with names.  You can use Test::constants and Kernel.const_get
  # too.

  ROOM_NAMES = { 'START' => CENTRAL_CORRIDOR,
    'bedroom' => BEDROOM,
    'getting dressed' => DRESSED,
    'normal clothes' => DRESSED1,
    'groovy clothes~' => DRESSED2,
    'rebel' => DRESSED3,
    'sleep ENDING' => SLEEPWIN,
    'bathroom' => BATHROOM,
    'brushy brushy' => BATHROOM1,
    'nice and clean :)' => BATHROOM2,
    'all done' => BATHROOM3,
    'dining room' => DROOM,
    'YUM' => DROOM125,
    'old reference...' => DROOM3,
    'spatial distortion' => SPACE,
    'distortion spatial' => SPACE1,
    'space ENDING' => SPACEWIN,
    'more spatial distortion' => HUDDLE,
    'eavesdropping' => HUDDLE2,
    'greeting the strangers' => HUDDLE3,
    'front of the school' => FINALE,
    'part 1 END' => FINALY,
  }

  def self::load_room(session)
    # given a session, this will return the right room or nil
    return ROOM_NAMES[session[:room]]
  end

  def self::save_room(session, room)
    # store the room in the session for later, using its name
    session[:room] = ROOM_NAMES.key(room)
  end
end