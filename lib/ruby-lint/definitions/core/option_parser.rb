##
# Constant: OptionParser
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_method('accept') do |method|
    method.define_rest_argument('args')
    method.define_block_argument('blk')
  end

  klass.define_method('getopts') do |method|
    method.define_rest_argument('args')
  end

  klass.define_method('inc') do |method|
    method.define_argument('arg')
    method.define_optional_argument('default')
  end

  klass.define_method('reject') do |method|
    method.define_rest_argument('args')
    method.define_block_argument('blk')
  end

  klass.define_method('terminate') do |method|
    method.define_optional_argument('arg')
  end

  klass.define_method('top')

  klass.define_method('with') do |method|
    method.define_rest_argument('args')
    method.define_block_argument('block')
  end

  klass.define_instance_method('abort') do |method|
    method.define_optional_argument('mesg')
  end

  klass.define_instance_method('accept') do |method|
    method.define_rest_argument('args')
    method.define_block_argument('blk')
  end

  klass.define_instance_method('add_officious')

  klass.define_instance_method('banner')

  klass.define_instance_method('banner=')

  klass.define_instance_method('base')

  klass.define_instance_method('def_head_option') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('def_option') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('def_tail_option') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('default_argv')

  klass.define_instance_method('default_argv=')

  klass.define_instance_method('define') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('define_head') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('define_tail') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('environment') do |method|
    method.define_optional_argument('env')
  end

  klass.define_instance_method('getopts') do |method|
    method.define_rest_argument('args')
  end

  klass.define_instance_method('help')

  klass.define_instance_method('inc') do |method|
    method.define_rest_argument('args')
  end

  klass.define_instance_method('load') do |method|
    method.define_optional_argument('filename')
  end

  klass.define_instance_method('make_switch') do |method|
    method.define_argument('opts')
    method.define_optional_argument('block')
  end

  klass.define_instance_method('new')

  klass.define_instance_method('on') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('on_head') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('on_tail') do |method|
    method.define_rest_argument('opts')
    method.define_block_argument('block')
  end

  klass.define_instance_method('order') do |method|
    method.define_rest_argument('argv')
    method.define_block_argument('block')
  end

  klass.define_instance_method('order!') do |method|
    method.define_optional_argument('argv')
    method.define_block_argument('nonopt')
  end

  klass.define_instance_method('parse') do |method|
    method.define_rest_argument('argv')
  end

  klass.define_instance_method('parse!') do |method|
    method.define_optional_argument('argv')
  end

  klass.define_instance_method('permute') do |method|
    method.define_rest_argument('argv')
  end

  klass.define_instance_method('permute!') do |method|
    method.define_optional_argument('argv')
  end

  klass.define_instance_method('program_name')

  klass.define_instance_method('program_name=')

  klass.define_instance_method('reject') do |method|
    method.define_rest_argument('args')
    method.define_block_argument('blk')
  end

  klass.define_instance_method('release')

  klass.define_instance_method('release=')

  klass.define_instance_method('remove')

  klass.define_instance_method('separator') do |method|
    method.define_argument('string')
  end

  klass.define_instance_method('set_banner')

  klass.define_instance_method('set_program_name')

  klass.define_instance_method('set_summary_indent')

  klass.define_instance_method('set_summary_width')

  klass.define_instance_method('summarize') do |method|
    method.define_optional_argument('to')
    method.define_optional_argument('width')
    method.define_optional_argument('max')
    method.define_optional_argument('indent')
    method.define_block_argument('blk')
  end

  klass.define_instance_method('summary_indent')

  klass.define_instance_method('summary_indent=')

  klass.define_instance_method('summary_width')

  klass.define_instance_method('summary_width=')

  klass.define_instance_method('terminate') do |method|
    method.define_optional_argument('arg')
  end

  klass.define_instance_method('to_a')

  klass.define_instance_method('to_s')

  klass.define_instance_method('top')

  klass.define_instance_method('ver')

  klass.define_instance_method('version')

  klass.define_instance_method('version=')

  klass.define_instance_method('warn') do |method|
    method.define_optional_argument('mesg')
  end
end

##
# Constant: OptionParser::Acceptables
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Acceptables') do |klass|

  klass.define_method('__module_init__')
end

##
# Constant: OptionParser::AmbiguousArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::AmbiguousArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::InvalidArgument'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::AmbiguousArgument::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::AmbiguousArgument::Reason') do |klass|
end

##
# Constant: OptionParser::AmbiguousOption
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::AmbiguousOption') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::ParseError'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::AmbiguousOption::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::AmbiguousOption::Reason') do |klass|
end

##
# Constant: OptionParser::Arguable
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Arguable') do |klass|

  klass.define_method('__module_init__')

  klass.define_method('extend_object') do |method|
    method.define_argument('obj')
  end

  klass.define_instance_method('getopts') do |method|
    method.define_rest_argument('args')
  end

  klass.define_instance_method('options')

  klass.define_instance_method('options=') do |method|
    method.define_argument('opt')
  end

  klass.define_instance_method('order!') do |method|
    method.define_block_argument('blk')
  end

  klass.define_instance_method('parse!')

  klass.define_instance_method('permute!')
end

##
# Constant: OptionParser::ArgumentStyle
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::ArgumentStyle') do |klass|
end

##
# Constant: OptionParser::CompletingHash
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash') do |klass|
  klass.inherits(RubyLint.global_constant('Hash'))

  klass.define_method('__class_init__')

  klass.define_instance_method('match') do |method|
    method.define_argument('key')
  end
end

##
# Constant: OptionParser::CompletingHash::Bucket
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::Bucket') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('delete') do |method|
    method.define_argument('key')
    method.define_argument('key_hash')
  end

  klass.define_instance_method('initialize') do |method|
    method.define_argument('key')
    method.define_argument('key_hash')
    method.define_argument('value')
    method.define_argument('state')
  end

  klass.define_instance_method('key')

  klass.define_instance_method('key=')

  klass.define_instance_method('key_hash')

  klass.define_instance_method('key_hash=')

  klass.define_instance_method('link')

  klass.define_instance_method('link=')

  klass.define_instance_method('next')

  klass.define_instance_method('next=')

  klass.define_instance_method('previous')

  klass.define_instance_method('previous=')

  klass.define_instance_method('remove')

  klass.define_instance_method('state')

  klass.define_instance_method('state=')

  klass.define_instance_method('value')

  klass.define_instance_method('value=')
end

##
# Constant: OptionParser::CompletingHash::Entries
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::Entries') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('[]') do |method|
    method.define_rest_argument('args')
  end

  klass.define_method('__class_init__')

  klass.define_method('_load') do |method|
    method.define_argument('str')
  end

  klass.define_method('allocate')

  klass.define_method('new') do |method|
    method.define_argument('cnt')
  end

  klass.define_method('pattern') do |method|
    method.define_argument('size')
    method.define_argument('obj')
  end

  klass.define_instance_method('+') do |method|
    method.define_argument('o')
  end

  klass.define_instance_method('==') do |method|
    method.define_argument('tup')
  end

  klass.define_instance_method('===') do |method|
    method.define_argument('other')
  end

  klass.define_instance_method('[]') do |method|
    method.define_argument('idx')
  end

  klass.define_instance_method('[]=') do |method|
    method.define_argument('idx')
    method.define_argument('val')
  end

  klass.define_instance_method('_dump') do |method|
    method.define_argument('depth')
  end

  klass.define_instance_method('at') do |method|
    method.define_argument('idx')
  end

  klass.define_instance_method('copy_from') do |method|
    method.define_argument('other')
    method.define_argument('start')
    method.define_argument('length')
    method.define_argument('dest')
  end

  klass.define_instance_method('delete') do |method|
    method.define_argument('start')
    method.define_argument('length')
    method.define_argument('object')
  end

  klass.define_instance_method('delete_at_index') do |method|
    method.define_argument('index')
  end

  klass.define_instance_method('dup')

  klass.define_instance_method('each')

  klass.define_instance_method('empty?')

  klass.define_instance_method('fields')

  klass.define_instance_method('first')

  klass.define_instance_method('insert_at_index') do |method|
    method.define_argument('index')
    method.define_argument('value')
  end

  klass.define_instance_method('inspect')

  klass.define_instance_method('join') do |method|
    method.define_argument('sep')
    method.define_optional_argument('meth')
  end

  klass.define_instance_method('join_upto') do |method|
    method.define_argument('sep')
    method.define_argument('count')
    method.define_optional_argument('meth')
  end

  klass.define_instance_method('last')

  klass.define_instance_method('length')

  klass.define_instance_method('put') do |method|
    method.define_argument('idx')
    method.define_argument('val')
  end

  klass.define_instance_method('reverse!') do |method|
    method.define_argument('start')
    method.define_argument('total')
  end

  klass.define_instance_method('shift')

  klass.define_instance_method('size')

  klass.define_instance_method('swap') do |method|
    method.define_argument('a')
    method.define_argument('b')
  end

  klass.define_instance_method('to_a')

  klass.define_instance_method('to_s')
end

##
# Constant: OptionParser::CompletingHash::Iterator
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::Iterator') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('initialize') do |method|
    method.define_argument('state')
  end

  klass.define_instance_method('next') do |method|
    method.define_argument('item')
  end
end

##
# Constant: OptionParser::CompletingHash::MAX_ENTRIES
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::MAX_ENTRIES') do |klass|
end

##
# Constant: OptionParser::CompletingHash::MIN_SIZE
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::MIN_SIZE') do |klass|
end

##
# Constant: OptionParser::CompletingHash::SortedElement
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::SortedElement') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('<=>') do |method|
    method.define_argument('other')
  end

  klass.define_instance_method('initialize') do |method|
    method.define_argument('val')
    method.define_argument('sort_id')
  end

  klass.define_instance_method('sort_id')

  klass.define_instance_method('value')
end

##
# Constant: OptionParser::CompletingHash::State
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::CompletingHash::State') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_method('from') do |method|
    method.define_argument('state')
  end

  klass.define_instance_method('compare_by_identity')

  klass.define_instance_method('compare_by_identity?')

  klass.define_instance_method('head')

  klass.define_instance_method('head=')

  klass.define_instance_method('initialize')

  klass.define_instance_method('match?') do |method|
    method.define_argument('this_key')
    method.define_argument('this_hash')
    method.define_argument('other_key')
    method.define_argument('other_hash')
  end

  klass.define_instance_method('tail')

  klass.define_instance_method('tail=')
end

##
# Constant: OptionParser::Completion
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Completion') do |klass|

  klass.define_method('__module_init__')

  klass.define_instance_method('complete') do |method|
    method.define_argument('key')
    method.define_optional_argument('icase')
    method.define_optional_argument('pat')
  end

  klass.define_instance_method('convert') do |method|
    method.define_optional_argument('opt')
    method.define_optional_argument('val')
    method.define_rest_argument('@unnamed_splat')
  end
end

##
# Constant: OptionParser::DecimalInteger
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::DecimalInteger') do |klass|
end

##
# Constant: OptionParser::DecimalNumeric
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::DecimalNumeric') do |klass|
end

##
# Constant: OptionParser::DefaultList
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::DefaultList') do |klass|
end

##
# Constant: OptionParser::InvalidArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::InvalidArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::ParseError'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::InvalidArgument::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::InvalidArgument::Reason') do |klass|
end

##
# Constant: OptionParser::InvalidOption
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::InvalidOption') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::ParseError'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::InvalidOption::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::InvalidOption::Reason') do |klass|
end

##
# Constant: OptionParser::LastModified
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::LastModified') do |klass|
end

##
# Constant: OptionParser::List
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::List') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('accept') do |method|
    method.define_argument('t')
    method.define_optional_argument('pat')
    method.define_block_argument('block')
  end

  klass.define_instance_method('add_banner') do |method|
    method.define_argument('to')
  end

  klass.define_instance_method('append') do |method|
    method.define_rest_argument('args')
  end

  klass.define_instance_method('atype')

  klass.define_instance_method('complete') do |method|
    method.define_argument('id')
    method.define_argument('opt')
    method.define_optional_argument('icase')
    method.define_rest_argument('pat')
    method.define_block_argument('block')
  end

  klass.define_instance_method('each_option') do |method|
    method.define_block_argument('block')
  end

  klass.define_instance_method('list')

  klass.define_instance_method('long')

  klass.define_instance_method('prepend') do |method|
    method.define_rest_argument('args')
  end

  klass.define_instance_method('reject') do |method|
    method.define_argument('t')
  end

  klass.define_instance_method('search') do |method|
    method.define_argument('id')
    method.define_argument('key')
  end

  klass.define_instance_method('short')

  klass.define_instance_method('summarize') do |method|
    method.define_rest_argument('args')
    method.define_block_argument('block')
  end
end

##
# Constant: OptionParser::MissingArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::MissingArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::ParseError'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::MissingArgument::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::MissingArgument::Reason') do |klass|
end

##
# Constant: OptionParser::NO_ARGUMENT
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::NO_ARGUMENT') do |klass|
end

##
# Constant: OptionParser::NeedlessArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::NeedlessArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::ParseError'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::NeedlessArgument::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::NeedlessArgument::Reason') do |klass|
end

##
# Constant: OptionParser::NoArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::NoArgument') do |klass|
end

##
# Constant: OptionParser::OPTIONAL_ARGUMENT
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OPTIONAL_ARGUMENT') do |klass|
end

##
# Constant: OptionParser::OctalInteger
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OctalInteger') do |klass|
end

##
# Constant: OptionParser::Officious
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Officious') do |klass|
end

##
# Constant: OptionParser::OptionMap
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap') do |klass|
  klass.inherits(RubyLint.global_constant('Hash'))

  klass.define_method('__class_init__')
end

##
# Constant: OptionParser::OptionMap::Bucket
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::Bucket') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('delete') do |method|
    method.define_argument('key')
    method.define_argument('key_hash')
  end

  klass.define_instance_method('initialize') do |method|
    method.define_argument('key')
    method.define_argument('key_hash')
    method.define_argument('value')
    method.define_argument('state')
  end

  klass.define_instance_method('key')

  klass.define_instance_method('key=')

  klass.define_instance_method('key_hash')

  klass.define_instance_method('key_hash=')

  klass.define_instance_method('link')

  klass.define_instance_method('link=')

  klass.define_instance_method('next')

  klass.define_instance_method('next=')

  klass.define_instance_method('previous')

  klass.define_instance_method('previous=')

  klass.define_instance_method('remove')

  klass.define_instance_method('state')

  klass.define_instance_method('state=')

  klass.define_instance_method('value')

  klass.define_instance_method('value=')
end

##
# Constant: OptionParser::OptionMap::Entries
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::Entries') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('[]') do |method|
    method.define_rest_argument('args')
  end

  klass.define_method('__class_init__')

  klass.define_method('_load') do |method|
    method.define_argument('str')
  end

  klass.define_method('allocate')

  klass.define_method('new') do |method|
    method.define_argument('cnt')
  end

  klass.define_method('pattern') do |method|
    method.define_argument('size')
    method.define_argument('obj')
  end

  klass.define_instance_method('+') do |method|
    method.define_argument('o')
  end

  klass.define_instance_method('==') do |method|
    method.define_argument('tup')
  end

  klass.define_instance_method('===') do |method|
    method.define_argument('other')
  end

  klass.define_instance_method('[]') do |method|
    method.define_argument('idx')
  end

  klass.define_instance_method('[]=') do |method|
    method.define_argument('idx')
    method.define_argument('val')
  end

  klass.define_instance_method('_dump') do |method|
    method.define_argument('depth')
  end

  klass.define_instance_method('at') do |method|
    method.define_argument('idx')
  end

  klass.define_instance_method('copy_from') do |method|
    method.define_argument('other')
    method.define_argument('start')
    method.define_argument('length')
    method.define_argument('dest')
  end

  klass.define_instance_method('delete') do |method|
    method.define_argument('start')
    method.define_argument('length')
    method.define_argument('object')
  end

  klass.define_instance_method('delete_at_index') do |method|
    method.define_argument('index')
  end

  klass.define_instance_method('dup')

  klass.define_instance_method('each')

  klass.define_instance_method('empty?')

  klass.define_instance_method('fields')

  klass.define_instance_method('first')

  klass.define_instance_method('insert_at_index') do |method|
    method.define_argument('index')
    method.define_argument('value')
  end

  klass.define_instance_method('inspect')

  klass.define_instance_method('join') do |method|
    method.define_argument('sep')
    method.define_optional_argument('meth')
  end

  klass.define_instance_method('join_upto') do |method|
    method.define_argument('sep')
    method.define_argument('count')
    method.define_optional_argument('meth')
  end

  klass.define_instance_method('last')

  klass.define_instance_method('length')

  klass.define_instance_method('put') do |method|
    method.define_argument('idx')
    method.define_argument('val')
  end

  klass.define_instance_method('reverse!') do |method|
    method.define_argument('start')
    method.define_argument('total')
  end

  klass.define_instance_method('shift')

  klass.define_instance_method('size')

  klass.define_instance_method('swap') do |method|
    method.define_argument('a')
    method.define_argument('b')
  end

  klass.define_instance_method('to_a')

  klass.define_instance_method('to_s')
end

##
# Constant: OptionParser::OptionMap::Iterator
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::Iterator') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('initialize') do |method|
    method.define_argument('state')
  end

  klass.define_instance_method('next') do |method|
    method.define_argument('item')
  end
end

##
# Constant: OptionParser::OptionMap::MAX_ENTRIES
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::MAX_ENTRIES') do |klass|
end

##
# Constant: OptionParser::OptionMap::MIN_SIZE
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::MIN_SIZE') do |klass|
end

##
# Constant: OptionParser::OptionMap::SortedElement
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::SortedElement') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_instance_method('<=>') do |method|
    method.define_argument('other')
  end

  klass.define_instance_method('initialize') do |method|
    method.define_argument('val')
    method.define_argument('sort_id')
  end

  klass.define_instance_method('sort_id')

  klass.define_instance_method('value')
end

##
# Constant: OptionParser::OptionMap::State
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionMap::State') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_method('from') do |method|
    method.define_argument('state')
  end

  klass.define_instance_method('compare_by_identity')

  klass.define_instance_method('compare_by_identity?')

  klass.define_instance_method('head')

  klass.define_instance_method('head=')

  klass.define_instance_method('initialize')

  klass.define_instance_method('match?') do |method|
    method.define_argument('this_key')
    method.define_argument('this_hash')
    method.define_argument('other_key')
    method.define_argument('other_hash')
  end

  klass.define_instance_method('tail')

  klass.define_instance_method('tail=')
end

##
# Constant: OptionParser::OptionalArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::OptionalArgument') do |klass|
end

##
# Constant: OptionParser::ParseError
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::ParseError') do |klass|
  klass.inherits(RubyLint.global_constant('RuntimeError'))

  klass.define_method('__class_init__')

  klass.define_method('filter_backtrace') do |method|
    method.define_argument('array')
  end

  klass.define_instance_method('args')

  klass.define_instance_method('inspect')

  klass.define_instance_method('message')

  klass.define_instance_method('reason')

  klass.define_instance_method('reason=')

  klass.define_instance_method('recover') do |method|
    method.define_argument('argv')
  end

  klass.define_instance_method('set_backtrace') do |method|
    method.define_argument('array')
  end

  klass.define_instance_method('set_option') do |method|
    method.define_argument('opt')
    method.define_argument('eq')
  end

  klass.define_instance_method('to_s')
end

##
# Constant: OptionParser::ParseError::Reason
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::ParseError::Reason') do |klass|
end

##
# Constant: OptionParser::RCSID
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::RCSID') do |klass|
end

##
# Constant: OptionParser::REQUIRED_ARGUMENT
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::REQUIRED_ARGUMENT') do |klass|
end

##
# Constant: OptionParser::Release
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Release') do |klass|
end

##
# Constant: OptionParser::RequiredArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::RequiredArgument') do |klass|
end

##
# Constant: OptionParser::SPLAT_PROC
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::SPLAT_PROC') do |klass|
end

##
# Constant: OptionParser::Switch
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Switch') do |klass|
  klass.inherits(RubyLint.global_constant('Object'))

  klass.define_method('__class_init__')

  klass.define_method('guess') do |method|
    method.define_argument('arg')
  end

  klass.define_method('incompatible_argument_styles') do |method|
    method.define_argument('arg')
    method.define_argument('t')
  end

  klass.define_method('pattern')

  klass.define_instance_method('add_banner') do |method|
    method.define_argument('to')
  end

  klass.define_instance_method('arg')

  klass.define_instance_method('block')

  klass.define_instance_method('conv')

  klass.define_instance_method('desc')

  klass.define_instance_method('long')

  klass.define_instance_method('match_nonswitch?') do |method|
    method.define_argument('str')
  end

  klass.define_instance_method('pattern')

  klass.define_instance_method('short')

  klass.define_instance_method('summarize') do |method|
    method.define_optional_argument('sdone')
    method.define_optional_argument('ldone')
    method.define_optional_argument('width')
    method.define_optional_argument('max')
    method.define_optional_argument('indent')
  end

  klass.define_instance_method('switch_name')
end

##
# Constant: OptionParser::Switch::NoArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Switch::NoArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::Switch'))

  klass.define_method('__class_init__')

  klass.define_method('incompatible_argument_styles') do |method|
    method.define_rest_argument('@unnamed_splat')
  end

  klass.define_method('pattern')

  klass.define_instance_method('parse') do |method|
    method.define_argument('arg')
    method.define_argument('argv')
  end
end

##
# Constant: OptionParser::Switch::OptionalArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Switch::OptionalArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::Switch'))

  klass.define_method('__class_init__')

  klass.define_instance_method('parse') do |method|
    method.define_argument('arg')
    method.define_argument('argv')
    method.define_block_argument('error')
  end
end

##
# Constant: OptionParser::Switch::PlacedArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Switch::PlacedArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::Switch'))

  klass.define_method('__class_init__')

  klass.define_instance_method('parse') do |method|
    method.define_argument('arg')
    method.define_argument('argv')
    method.define_block_argument('error')
  end
end

##
# Constant: OptionParser::Switch::RequiredArgument
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Switch::RequiredArgument') do |klass|
  klass.inherits(RubyLint.global_constant('OptionParser::Switch'))

  klass.define_method('__class_init__')

  klass.define_instance_method('parse') do |method|
    method.define_argument('arg')
    method.define_argument('argv')
  end
end

##
# Constant: OptionParser::Version
# Created:  2013-04-01 18:33:54 +0200
# Platform: rbx 2.0.0.rc1
#
RubyLint.global_scope.define_constant('OptionParser::Version') do |klass|
end