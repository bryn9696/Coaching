require 'coaching'

describe Coaching_Jobs do

  it 'Adds job details into the jobs table' do
    Coaching_Jobs.create_job(job_name: 'Another Job',price: '1',description: 'This is also a job', user_id: 1)
    connection = PG.connect(dbname: 'coaching_test')
    result = connection.exec('SELECT * FROM jobs')
    expect(result.map {|jobs| p jobs['name'] }).to include('Another Job')
  end

  it 'can check if a users job is unique' do 
    Coaching_Jobs.create_job(job_name: 'Another Job',price: '1',description: 'This is also a job', user_id: 1)
    expect(Coaching_Jobs.exist?(job_name: 'Another Job')).to eq true 
  end

  it '.view_job' do
    Coaching_Jobs.create_job(job_name: 'Another Job',price: '1',description: 'This is also a job', user_id: 1)
    DatabaseConnection.query('SELECT * FROM jobs')
    expect(Coaching_Jobs.view_jobs[0]['name']).to eq('Another Job')
    expect(Coaching_Jobs.view_jobs[0]['id']).to eq('1')
  end
  
end