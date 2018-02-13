namespace :run_batches_in_slice do
  desc "Run batches in slice"
  task :process, [:offset] => :environment do |_, args|
    raise 'Argument is not present' if args[:offset].blank?    
    offset = args[:offset].to_i * 10000000
    min = 1 + offset
    max = 10000000 + offset
    cond = {fixme: true}
    Entity.where("id >= #{min} AND id < #{max}").where(cond).find_in_batches.with_index do |group, batch|
      # print "batch #{batch}... (#{group.first.id}..#{group.last.id}) "
      group.each{|x| x.update_me}
    end
  end
end
