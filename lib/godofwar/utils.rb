module GodOfWar
  module Utils

    # fix target/project name if the target is a URL (eg. http://example.com/app1/route2/ to be example.com-app1-route2)
    #
    # @return [String]
    def fix_project_naming(project)
      project.gsub(/http[:|s]+\/\//, '').gsub('/', '-').gsub(/-*$/, '')
    end

    # banner
    def self.banner
      <<~BANNER
                              .
                             hhh              
                            hhhhhhh           
                           hhhhhhhh        
                          hhhhhhhh+        
                         hhhhhhhh'           
                        hhhhhhhh.            
                       hhhhhhhhh             
        ..--          hhhhhhhhh             
      -sh/..  +.     hhhhhhhhh:              
      /+/:-/+ss-`   hhhhhhhhhh:               
      /MMM`ss:``.`  hhhhhhhhhh:              
     .MMMMM:        hhhhhhhhhhhhhhhhh:       
     MMMMMMM:        hhhhhhhhhhhhhhhh:      
     MMMMMMMMMMMMM:  hhhhhhhhhhhhhhhh`       
    :NNm:odh/oMMMNs. hhhhhhhhhhhhhhhh`       
   ./:`smdo+oos++-    `++sNMMMMMNmh+         
      .-y-`     ` :.  /   -dmddhhhhh-        
       o/-     `//o/ /M/   `+hhhhhhhh`       
      /o     :yosmy   +y  .`.hhhhhhhho       
      +`     /../.:      `.y::hhhhhs:`       
       `      `+yys`   .sy` /oohhy:          
                `/:s/-``     `.hh`           
               ..`     `       y+            
            .hNNmmNdymmmmds`   :-            
            hs.   ``..    :y-  `             
               -hhmNmddm+   .                
               `NMMMMMMm                     
                ` `oMMy                      
            `.     /Md-      :o  
           MMMMMMMMMMMMMMMMMMM:             
            MMMMMMMMMMMMMMMMMM:              
             MMMMMMMMMMMMMMMMM               
              MMMMMMMMMMMMMMM.               
              `MMMMMMMMMMMMM.                 
                :sNMMMNMdo:                  
                  ``+m:/-                    
                     `
      BANNER
    end
  end
end