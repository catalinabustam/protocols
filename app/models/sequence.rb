class Sequence 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  belongs_to :device, inverse_of: :sequences
  

  field :name, type: String

  def self.import(file,device,name)

    text = File.read(file)
  	replace = text.gsub(/;/,'').gsub(/ =/,',').gsub(/\t/,"").gsub(/\r/,"").gsub(/"/,"").gsub(/[()]/, "_")
  
    hash=Hash.new
    hash["nombre"]=name
    pre_line=""
    
    replace.each_line do |line|
  
    ns=line[/\A */].size
    line[0,ns]=pre_line[0,ns]
 
    pre_line=line
    v=line.match /.*(?<=,)/ 


    key=$&[0...-1].delete('.').gsub(/\s+/, '_').gsub(/,/, '_').gsub(/-/, '_').gsub(/%/, '').gsub(/\//, '_').gsub(/\+/,'_')

    d=line.match /(?<=,).*/ 
    value= $&
    hash["#{key}"]=value
    end
 
    @sequence=device.sequences.create(hash)
    

  end
end
