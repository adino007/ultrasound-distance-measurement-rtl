`timescale 1ns / 1ps

module calcLaserD(
    input clk,
    input reset,
    input startBtn,
    input stopBtn,
    output reg [15:0] D, // OUTPUT D
    output [3:0] an,  // OUTPUT
    output [6:0] seg
    );
    
    localparam [3:0] s0 = 0,
                     s1 = 1,
                     s2 = 2,
                     s3 = 3,
                     s4 = 4;
                                                    
    reg [3:0] State;    // HLSM State
    reg [15:0] Dctr;    // HLSM VARIABLE
//    reg [15:0] D;
    reg [3:0] hundreds;
    reg [3:0] tens;
    reg [3:0] ones;
    reg [3:0] temp;
    reg l;
    wire second_elapsed;
      
    disp_mux uut(.clk(clk), .reset(reset), .in2(hundreds), .in1(tens), .in0(ones), .an(an), .seg(seg));
    
    second sec(.Y(second_elapsed), .clk(clk), .reset(stopBtn));
    
    //Add N-bit register code for q_reg here:
    always @(posedge clk) begin
        if (reset) begin
            // Reset logic
            State <= s0;
            l <= 0;
            D <= 0;
            Dctr <= 0;
            hundreds <= 0;
            tens <= 0;
            ones <= 0;
        end
        else begin
            case (State)
                s0: begin
                    State = s1;
                end
                
                s1: begin
                    if (startBtn) begin
                        State = s2;
                    end
                    else if(!startBtn) begin
                        State = s1;
                    end
                end
            
                s2: begin
                    State = s3;
                end
                
                s3: begin
                    if (stopBtn) begin // once sense laser
                        State = s4;
                    end
                    else if (!stopBtn) begin
                        State = s3;
                    end
                end
                
                s4: begin
                    State = s1;
                end
                
                default: begin
                    State = s0;
                end            
            endcase
          end
    
    case (State) 
        s0: begin
            l = 0;
            D = 0;
            Dctr = 0;
        end
        
        s1: begin
            l = 0;
        end
        
        s2: begin
            l = 1;
        end
        
        s3: begin
            l = 0;
            if (second_elapsed) begin
                Dctr = Dctr + 1;
            end
        end
        
        s4: begin
            D = Dctr >> 1;
            // Split D into hundred tens and ones
            hundreds = D /100;
            tens = (D-hundreds)/10;
            ones = D-(100*hundreds)-(10*tens);
        end
        
        default: begin
            l = 0;
            D = 0;
            Dctr = 0;
        end
    endcase
    
end

        
endmodule
