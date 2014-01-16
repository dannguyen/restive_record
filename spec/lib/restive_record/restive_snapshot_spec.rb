require 'spec_helper'

describe RestiveRecord::Snapshot do
  it "should include the `SnapshotConcern` module to get base functionality" do
    RestiveRecord::Snapshot.should include(RestiveRecord::SnapshotConcern)
  end

  describe "Attributes" do
    it { should have_db_column(:price).of_type(:float) }
    it { should have_db_column(:snapped_at).of_type(:datetime )}
    it { should have_db_column(:restive_record_id).of_type(:integer) }
# and more
  end


  describe "Indexes" do
    it { should have_db_index(:restive_record_id)}
  end

end