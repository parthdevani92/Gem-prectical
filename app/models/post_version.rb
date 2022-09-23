class PostVersion < PaperTrail::Version
    self.table_name = :post_versions
    default_scope { where.not(event: 'create') } 
  end