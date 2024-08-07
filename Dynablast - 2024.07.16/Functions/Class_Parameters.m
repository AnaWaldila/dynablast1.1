classdef Class_Parameters
    
    % =================================================================== %
    % DESCRIPTION
    
    % This class represents a verification with all parameters that are
    % presents in both cases: general analysis and advanced analysis.
    % For each case, some parameters changes for general or advanced
    % analysis. Because of this, a behavior of blast wave and plate's
    % parameters can change. 
    % So, its easier manipulate the advanced parameters hear than
    % modificate all time in Class_Blast, Class_K1K3, Class_Disp and
    % Class_Period
    
    % =================================================================== %
    
    %% Public attributes
    properties (SetAccess = public, GetAccess = public)
        
        tnt             Class_TNT              % TNT's properties
        analysis        Class_Analysis         % Type Analysis propertie
        advanalysis     Class_AdvAnalysis      % Type of Advanced Analysis
        
        Z           = 0;    % Variable about parameter Z
        W           = 0;    % Variable about parameter W
        R           = 0;    % Variable about parameter R
        negative    = 0;    % Variable about negative phase consideration
                            % negative = 0 (OFF), 
                            % negative = 1 (Extended Positive Phase),
                            % negative = 2 (Cubic Equation)
        nonlinear   = 0;    % Variable about (non)linearyti consideration
                            % nonlinear = 0 (OFF), nonlinear = 1(ON)
        
    end
    
    %% Constructor Mode
    methods
        
        function this = Class_Parameters(tnt, analysis, advanalysis)
            if (nargin > 0)
                
                % Functions
                this = this.Parameter_Z(tnt, analysis, advanalysis);
                this = this.Parameter_W(tnt, analysis, advanalysis);
                this = this.Parameter_R(tnt, analysis, advanalysis);
                this = this.Parameter_Nonlinear(analysis, advanalysis);
                this = this.Parameter_Negative(tnt, analysis, advanalysis);
            
            end
            
        end
                
    end
    
    %% Public Methods
    methods
       
        % =============================================================== %
        
        % Function about parameter Z (scaled distance)
        function this = Parameter_Z(this, tnt, analysis, advanalysis)
            
            this.tnt            = tnt;
            this.analysis       = analysis;
            this.advanalysis    = advanalysis;
            
            button              = this.analysis.gen_button;
            parameter           = this.advanalysis.adv_parameter;
            
            switch button
                case 0  % General Button (Do not use advanced analysis)
                    this.Z      = this.tnt.Z;
                case 1  % Advanced Button
                    if parameter == 4 
                            this.Z   = this.tnt.Z;
                    else
                            this.Z   = this.advanalysis.Z_initial;
                    end

            end
            
        end
        
        % =============================================================== %
        
        % Function about parameter W (TNT's weight)
        function this = Parameter_W(this, tnt, analysis, advanalysis)
            
            this.tnt            = tnt;
            this.analysis       = analysis;
            this.advanalysis    = advanalysis;
            
            button              = this.analysis.gen_button;
            parameter           = this.advanalysis.adv_parameter;
            %equation            = this.advanalysis.adv_equation;
            
            switch button
                case 0  % General Button (Do not use advanced analysis)
                    this.W         = this.tnt.W;
                case 1  % Advanced Button
                    if parameter == 2 || parameter == 4 || ...
                            parameter == 10 || parameter == 11
                        this.W         = this.advanalysis.W_initial;
                    else
                        this.W         = this.tnt.W;
                    end

            end
            
        end
        
        % =============================================================== %
        
        % Function about parameter R (scaled distance)
        function this = Parameter_R(this, tnt, analysis, advanalysis)
            
            this.tnt            = tnt;
            this.analysis       = analysis;
            this.advanalysis    = advanalysis;
            
            button              = this.analysis.gen_button;
            %parameter           = this.advanalysis.adv_parameter;
            
            switch button
                case 0  % General Button (Do not use advanced analysis)
                    this.R      = this.tnt.R;
                case 1  % Advanced Button
                    this.R      = this.tnt.R;
            end
            
        end
        
        % =============================================================== %
        
        % Function about parameter nonlinearyti
        function this = Parameter_Nonlinear(this, analysis, advanalysis)
            
            this.analysis       = analysis;
            this.advanalysis    = advanalysis;
            
            button              = this.analysis.gen_button;
            parameter           = this.advanalysis.adv_parameter;
         
            % analysis about advanced analysis
            switch button
                case 0  % General Button (Do not use advanced analysis)
                    this.nonlinear = this.analysis.nonlinear;
                case 1  % Advanced Button
                    if parameter == 2
                        this.nonlinear = this.advanalysis.adv_nonlinear;
                    else
                        this.nonlinear = this.analysis.nonlinear;
                    end
            end
            
        end
        
        % =============================================================== %
        
        % Function about parameter negative phase
        function this = Parameter_Negative(this, tnt, analysis, advanalysis)
            
            this.tnt            = tnt;
            this.analysis       = analysis;
            this.advanalysis    = advanalysis;
            
            button              = this.analysis.gen_button;
            parameter           = this.advanalysis.adv_parameter;
            
            % analysis about advanced analysis
            switch button
                case 0  % General Button (Do not use advanced analysis)
                    this.negative  = this.tnt.negative;
                case 1  % Advanced Button
                    if parameter == 2
                        this.negative  = this.advanalysis.adv_negative;
                    else
                        this.negative  = this.tnt.negative;
                    end
            end
            
        end
        
    end
    
end