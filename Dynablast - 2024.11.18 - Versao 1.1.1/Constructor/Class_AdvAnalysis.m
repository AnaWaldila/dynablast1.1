classdef Class_AdvAnalysis
    
    % This code open the constructor mode, where defines the
    % characteristics of the analysis
    
    % Variables
    % sup: type of support (0 for simple support and 1 for campled)
    % type_sup: type of support of membrane (1 for immovable, 2 for movable
    % and 3 for stress free)
    % a: length for x direction (m)
    % beta: ratio a / b
    % E: Young's Modulus (N/m�)
    % h: tickness (m)
    % nu: Poisson's coeficient
    % rho: material's density (kg/m�)
    % type: type of explosion (1 for Hemispherical and 2 for Spherical)
    % Z: Scale distance (m/kg^1/3)
    % W: TNT's mass (kg)
    % nonlinear: nonlinear effect (0 for not and 1 for yes)
    % time: time of analisys (s)
    
    %% Public attributes
    properties (SetAccess = public, GetAccess = public)
        
        adv_nonlinear   = 0;    % Verificating if analu
        adv_parameter   = 0;    % Parameter for each type of advanced 
                                % analysis
        Z_initial       = 0;    % First type of advanced analysis
        W_final         = 0;    % Final wieght fo TNT
        W_initial       = 0;
        interval        = 0;    % Number of intervals
        adv_negative    = 0;    % Verificating negative phase
        adv_equation    = 0;    % Variable to identify which equation the 
                                % user wants: W = 1 to 10 kg (equation = 1)
                                % or W = 100 to 1000 (equation = 2)
        
    end
    
    %% Constructor method
    methods
        
        % =============================================================== %
        
        % Constructor function
        function adv = Class_AdvAnalysis...
                (adv_nonlinear, adv_parameter, Z_initial, ...
                W_initial, W_final, interval, adv_negative, adv_equation)

            if (nargin > 0)
                
                adv.adv_nonlinear   = adv_nonlinear;
                adv.adv_parameter   = adv_parameter;
                adv.adv_negative    = adv_negative;
                
                adv.Z_initial       = Z_initial;
                adv.W_final         = W_final;
                adv.W_initial       = W_initial;
                adv.interval        = interval;
                adv.adv_equation    = adv_equation; 
                             
            else
                
                adv.adv_nonlinear   = 1;
                adv.adv_parameter   = 1;
                adv.adv_negative    = 1;
                
                adv.Z_initial       = 5.64;
                adv.W_final         = 100;
                adv.W_initial       = 1;
                adv.interval        = 100;
                adv.adv_equation    = 1;
                
            end
        end     
    end
end