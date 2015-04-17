class Sequence 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :protocol, inverse_of: :sequences
  

  field :name, type: String

  def self.import(file,protocol,name)

    text = File.read(file)

  	replace = text.gsub(/;/,'').gsub(/ =/,',').gsub(/\t/,"").gsub(/\r/,"").gsub(/"/,"").gsub(/[()]/, "_")
    puts "replacee"
    puts replace

    prueba=Hash.new
    prueba["nombre"]=name

    
    #otro1=Hash[*replace.split(/[, \n]+/)]

    #puts "que es eso"

    #lines = File.readlines(file)
    #lines.map do |line|
    pre_line=""
    
    replace.each_line do |line|
    a=line.split.first
    b=line.match(/^[ \t]+/).nil?
    ns=line[/\A */].size
    line[0,ns]=pre_line[0,ns]
    puts "line"
    puts line
    pre_line=line

    puts ns
    c=line.match /.*(?<=,)/ 
    puts c
    key=$&[0...-1].delete('.').gsub(/\s+/, '_')
    puts key
    d=line.match /(?<=,).*/ 
    value= $&
    prueba["#{key}"]=value
 
    puts prueba
    end
    puts "prueba finallllllllll"
    puts ""
    puts prueba

    #otro= Hash[*File.read(file).split(/[, \n]+/)]
    @sequence=protocol.sequences.create(prueba)
    #@sequence.update_attributes(otro1)

  


  	#File.open(file, "w") {|fil| fil.puts replace}

    #@sequence=protocol.sequences.create(nombre: name)

  	#options = {:col_sep => "=", :row_sep=> ";\r\n", :quote_char => "\x00", :headers_in_file => "false" }
	 #n = SmarterCSV.process(file, options)

   #puts "smartercsv ....."
   #puts n
   #csv = CSV.parse(text) 
    #puts "csv text"
    #puts csv
    #@sequence.update_attributes(array)
    

  end
end
