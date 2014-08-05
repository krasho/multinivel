module SupervisorsHelper

  def supervisor_company_name(supervisor)
    if supervisor.company.nil?
      "[Sin empresa]"
    else
      supervisor.company.name
    end
  end

end
