" Vim syntax file
" Language: Kotlin
" Maintainer: Alexander Udalov
" Latest Revision: 20 April 2021

if exists('b:current_syntax')
    finish
endif

syn keyword ktStatement break continue return
syn keyword ktConditional if else when
syn keyword ktRepeat do for while
syn keyword ktOperator in is by
syn keyword ktKeyword get set out super this where
syn keyword ktException try catch finally throw

syn keyword ktInclude import package

" The following is generated by generate-stdlib-class-names.main.kts
syn keyword ktType AbstractCollection AbstractCoroutineContextElement AbstractCoroutineContextKey AbstractDoubleTimeSource AbstractIterator AbstractList AbstractLongTimeSource
syn keyword ktType AbstractMap AbstractMutableCollection AbstractMutableList AbstractMutableMap AbstractMutableSet AbstractSet AccessDeniedException Accessor Annotation
syn keyword ktType AnnotationRetention AnnotationTarget Any Appendable ArithmeticException Array ArrayDeque ArrayList AssertionError Boolean BooleanArray BooleanIterator
syn keyword ktType BuilderInference Byte ByteArray ByteIterator CallsInPlace CancellationException Char CharArray CharCategory CharDirectionality CharIterator CharProgression
syn keyword ktType CharRange CharSequence CharacterCodingException Charsets ClassCastException Cloneable ClosedFloatingPointRange ClosedRange Collection Comparable Comparator
syn keyword ktType ConcurrentModificationException ConditionalEffect Continuation ContinuationInterceptor ContractBuilder CoroutineContext DeepRecursiveFunction DeepRecursiveScope
syn keyword ktType Delegates Deprecated DeprecatedSinceKotlin DeprecationLevel Destructured Double DoubleArray DoubleIterator DslMarker Duration DurationUnit Effect Element
syn keyword ktType EmptyCoroutineContext Entry Enum Error Exception Experimental ExperimentalContracts ExperimentalJsExport ExperimentalMultiplatform ExperimentalStdlibApi
syn keyword ktType ExperimentalTime ExperimentalTypeInference ExperimentalUnsignedTypes ExtensionFunctionType FileAlreadyExistsException FileSystemException FileTreeWalk
syn keyword ktType FileWalkDirection Float FloatArray FloatIterator Function Function0 Function1 Function10 Function11 Function12 Function13 Function14 Function15 Function16
syn keyword ktType Function17 Function18 Function19 Function2 Function20 Function21 Function22 Function3 Function4 Function5 Function6 Function7 Function8 Function9 FunctionN
syn keyword ktType Getter Grouping HashMap HashSet IllegalArgumentException IllegalStateException IndexOutOfBoundsException IndexedValue Int IntArray IntIterator IntProgression
syn keyword ktType IntRange InvocationKind Iterable Iterator JsExport JsName JvmDefault JvmDefaultWithoutCompatibility JvmField JvmInline JvmMultifileClass JvmName JvmOverloads
syn keyword ktType JvmRecord JvmStatic JvmSuppressWildcards JvmSynthetic JvmWildcard KAnnotatedElement KCallable KClass KClassifier KDeclarationContainer KFunction KMutableProperty
syn keyword ktType KMutableProperty0 KMutableProperty1 KMutableProperty2 KParameter KProperty KProperty0 KProperty1 KProperty2 KType KTypeParameter KTypeProjection KVariance
syn keyword ktType KVisibility Key Kind KotlinNullPointerException KotlinReflectionNotSupportedError KotlinVersion Lazy LazyThreadSafetyMode Level LinkedHashMap LinkedHashSet List
syn keyword ktType ListIterator Long LongArray LongIterator LongProgression LongRange Map MatchGroup MatchGroupCollection MatchNamedGroupCollection MatchResult Metadata Monotonic
syn keyword ktType MustBeDocumented MutableCollection MutableEntry MutableIterable MutableIterator MutableList MutableListIterator MutableMap MutableSet NoSuchElementException
syn keyword ktType NoSuchFileException NoWhenBranchMatchedException NotImplementedError Nothing NullPointerException Number NumberFormatException ObservableProperty OnErrorAction
syn keyword ktType OptIn OptionalExpectation OverloadResolutionByLambdaReturnType Pair ParameterName PropertyDelegateProvider PublishedApi PurelyImplements Random RandomAccess
syn keyword ktType ReadOnlyProperty ReadWriteProperty Regex RegexOption Repeatable ReplaceWith RequiresOptIn RestrictsSuspension Result Retention Returns ReturnsNotNull
syn keyword ktType RuntimeException Sequence SequenceScope Set Setter SharedImmutable Short ShortArray ShortIterator SimpleEffect SinceKotlin Strictfp String StringBuilder Suppress
syn keyword ktType Synchronized Target TestTimeSource ThreadLocal Throwable Throws TimeMark TimeSource TimedValue Transient Triple TypeCastException Typography UByte UByteArray
syn keyword ktType UByteIterator UInt UIntArray UIntIterator UIntProgression UIntRange ULong ULongArray ULongIterator ULongProgression ULongRange UShort UShortArray UShortIterator
syn keyword ktType UninitializedPropertyAccessException Unit UnsafeVariance UnsupportedOperationException UseExperimental Volatile

syn keyword ktModifier annotation companion enum inner abstract final open override sealed vararg dynamic expect actual suspend
syn keyword ktStructure class object interface typealias fun val var constructor init

syn keyword ktReservedKeyword typeof

syn keyword ktBoolean true false
syn keyword ktConstant null

syn keyword ktModifier reified external inline noinline crossinline

syn match ktModifier "\v<(data|value)>\ze\@=.*<class>"
syn match ktModifier "\v<(tailrec|operator|infix)>\ze\@=.*<fun>"
syn match ktModifier "\v<(const)>\ze\@=.*<val>"
syn match ktModifier "\v<(lateinit)>\ze\@=.*<var>"
syn match ktModifier "\v<(internal|private|protected|public)>\ze\@=.*<(class|object|interface|typealias|fun|val|var|constructor|get|set)>"

syn match ktOperator "\v\?:|::|\<\=? | \>\=?|[!=]\=\=?|<as>\??|[-!%&*+/|]"

syn keyword ktTodo TODO FIXME XXX contained
syn match ktShebang "\v^#!.*$"
syn match ktLineComment "\v//.*$" contains=ktTodo,@Spell
syn region ktComment matchgroup=ktCommentMatchGroup start="/\*" end="\*/" contains=ktComment,ktTodo,@Spell

syn region ktDocComment start="/\*\*" end="\*/" contains=ktDocTag,ktTodo,@Spell
syn match ktDocTag "\v\@(author|constructor|receiver|return|since|suppress)>" contained
syn match ktDocTag "\v\@(exception|param|property|throws|see|sample)>\s*\S+" contains=ktDocTagParam contained
syn match ktDocTagParam "\v(\s|\[)\S+" contained
syn match ktComment "/\*\*/"

syn match ktSpecialCharError "\v\\." contained
syn match ktSpecialChar "\v\\([tbnr'"$\\]|u\x{4})" contained
syn region ktString start='"' skip='\\"' end='"' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError,@Spell
syn region ktString start='"""' end='""""*' contains=ktSimpleInterpolation,ktComplexInterpolation,@Spell
syn match ktCharacter "\v'[^']*'" contains=ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'\\''" contains=ktSpecialChar
syn match ktCharacter "\v'[^\\]'"

" TODO: highlight label in 'this@Foo'
syn match ktAnnotation "\v(\w)@<!\@[[:alnum:]_.]*(:[[:alnum:]_.]*)?"
syn match ktLabel "\v\w+\@"

syn match ktSimpleInterpolation "\v\$\h\w*" contained
syn region ktComplexInterpolation matchgroup=ktComplexInterpolationBrace start="\v\$\{" end="\v\}" contains=ALLBUT,ktSimpleInterpolation,ktTodo,ktSpecialCharError,ktSpecialChar,ktDocTag,ktDocTagParam

syn match ktNumber "\v<\d+[_[:digit:]]*(uL?|UL?|[LFf])?"
syn match ktNumber "\v<0[Xx]\x+[_[:xdigit:]]*(uL?|UL?|L)?"
syn match ktNumber "\v<0[Bb][01]+[_01]*(uL?|UL?|L)?"
syn match ktFloat "\v<\d*(\d[eE][-+]?\d+|\.\d+([eE][-+]?\d+)?)[Ff]?"

syn match ktEscapedName "\v`.*`"

syn match ktExclExcl "!!"
syn match ktArrow "->"

hi def link ktStatement Statement
hi def link ktConditional Conditional
hi def link ktRepeat Repeat
hi def link ktOperator Operator
hi def link ktKeyword Keyword
hi def link ktException Exception
hi def link ktReservedKeyword Error

hi def link ktInclude Include

hi def link ktType Identifier
hi def link ktModifier Keyword
hi def link ktStructure Identifier
hi def link ktTypedef Identifier

hi def link ktBoolean Boolean
hi def link ktConstant Constant

hi def link ktTodo Todo
hi def link ktShebang Comment
hi def link ktLineComment Comment
hi def link ktComment Comment
hi def link ktCommentMatchGroup Comment
hi def link ktDocComment Comment
hi def link ktDocTag Special
hi def link ktDocTagParam Identifier

hi def link ktSpecialChar SpecialChar
hi def link ktSpecialCharError Error
hi def link ktString String
hi def link ktCharacter Character

hi def link ktAnnotation Identifier
hi def link ktLabel Identifier

hi def link ktSimpleInterpolation Identifier
hi def link ktComplexInterpolationBrace Identifier

hi def link ktNumber Number
hi def link ktFloat Float

hi def link ktExclExcl Special
hi def link ktArrow Keyword

let b:current_syntax = 'kotlin'
