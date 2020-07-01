class CandidatesController < ApplicationController
    
    before_action :find_candidate, only: [:edit, :vote, :update, :show, :destroy]

    def index   
        @candidates = Candidate.all
    end

    def edit
    end

    def vote 
        @candidate.votelogs.create(ip_address: request.remote_ip)
        redirect_to'/candidates', notice: "You have voted!"
    end

    def update
        if @candidate.update(candidate_params)
            #OK
            redirect_to'/candidates', notice: "candidate updated"
        else
            #NG
            render :edit
        end
    end
 
    def show
    end

    def destroy
        @candidate.destroy
        redirect_to'/candidates', notice: 'candidate destroyed'
    end

    def new
        @candidate = Candidate.new
    end

    def create  
        clean_params = params.require(:candidate).permit(:name, :party, :age, :politics)
        @candidate = Candidate.new(clean_params)
        if @candidate.save
            #OK
            redirect_to'/candidates', notice: "candidate created"
        else
            #NG
            render :new
        end
    end

    private
    def candidate_params
        clean_params = params.require(:candidate).permit(:name, :party, :age, :politics)
    end

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
end