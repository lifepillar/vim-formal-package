" Name:        CryptoVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=100
syn case match
syn iskeyword @,48-57,192-255,_,'

syn keyword cryptoverifKeyword builtin channel collision const def defined do else eps_find
syn keyword cryptoverifKeyword eps_rand equation equiv equivalence event event_abort expand find
syn keyword cryptoverifKeyword forall foreach fun get if implementation in inf insert length
syn keyword cryptoverifKeyword let letfun max maxlength new newChannel newOracle orfind out param Pcoll1rand
syn keyword cryptoverifKeyword Pcoll2rand proba process proof public_vars query query_equiv return run
syn keyword cryptoverifKeyword secret
" syn keyword cryptoverifKeyword set " See cryptoverifSettings
syn keyword cryptoverifKeyword special suchthat table then time type yield
syn match   cryptoverifKeyword /\<inj-event\>/
syn match   cryptoverifKeyword /\<independent-of\>/

syn keyword cryptoverifIdentifier AC ACU ACUN assoc assocU commut commut_group group

" To extract macros's names, edit default.cvl using this script:
" :g!/^\s*def\>/norm dd
" :%s/^\s*def\s*
" :%s/^[^(]\+\zs(.*$
" :sort
" :se tw=80
" :norm ggVGgw
" :%s/^/syn keyword cryptoverifMacro /
syn keyword cryptoverifMacro AEAD AEAD_INDdollar_CPA AEAD_INDdollar_CPA_all_args AEAD_INDdollar_CPA_nonce
syn keyword cryptoverifMacro AEAD_all_args AEAD_from_AEAD_nonce AEAD_from_Enc_then_MAC AEAD_nonce
syn keyword cryptoverifMacro AEAD_nonce_all_args AuthEnc_from_AEAD AuthEnc_from_AEAD_nonce
syn keyword cryptoverifMacro Auth_Enc_from_Enc_then_MAC CDH CDH_RSR CollisionResistant_hash
syn keyword cryptoverifMacro CollisionResistant_hash_1 CollisionResistant_hash_10 CollisionResistant_hash_2
syn keyword cryptoverifMacro CollisionResistant_hash_3 CollisionResistant_hash_4 CollisionResistant_hash_5
syn keyword cryptoverifMacro CollisionResistant_hash_6 CollisionResistant_hash_7 CollisionResistant_hash_8
syn keyword cryptoverifMacro CollisionResistant_hash_9 DDH DH_X25519 DH_X448 DH_basic
syn keyword cryptoverifMacro DH_dist_random_group_element_vs_exponent DH_good_group DH_proba_collision
syn keyword cryptoverifMacro DH_single_coord_ladder FixedPreimageResistant_hash FixedPreimageResistant_hash_1
syn keyword cryptoverifMacro FixedPreimageResistant_hash_10 FixedPreimageResistant_hash_2
syn keyword cryptoverifMacro FixedPreimageResistant_hash_3 FixedPreimageResistant_hash_4
syn keyword cryptoverifMacro FixedPreimageResistant_hash_5 FixedPreimageResistant_hash_6
syn keyword cryptoverifMacro FixedPreimageResistant_hash_7 FixedPreimageResistant_hash_8
syn keyword cryptoverifMacro FixedPreimageResistant_hash_9 FixedPreimageResistant_hash_all_args
syn keyword cryptoverifMacro FixedPreimageResistant_hash_all_args_1 FixedPreimageResistant_hash_all_args_10
syn keyword cryptoverifMacro FixedPreimageResistant_hash_all_args_2 FixedPreimageResistant_hash_all_args_3
syn keyword cryptoverifMacro FixedPreimageResistant_hash_all_args_4 FixedPreimageResistant_hash_all_args_5
syn keyword cryptoverifMacro FixedPreimageResistant_hash_all_args_6 FixedPreimageResistant_hash_all_args_7
syn keyword cryptoverifMacro FixedPreimageResistant_hash_all_args_8 FixedPreimageResistant_hash_all_args_9
syn keyword cryptoverifMacro FixedSecondPreimageResistant_hash FixedSecondPreimageResistant_hash_1
syn keyword cryptoverifMacro FixedSecondPreimageResistant_hash_10 FixedSecondPreimageResistant_hash_2
syn keyword cryptoverifMacro FixedSecondPreimageResistant_hash_3 FixedSecondPreimageResistant_hash_4
syn keyword cryptoverifMacro FixedSecondPreimageResistant_hash_5 FixedSecondPreimageResistant_hash_6
syn keyword cryptoverifMacro FixedSecondPreimageResistant_hash_7 FixedSecondPreimageResistant_hash_8
syn keyword cryptoverifMacro FixedSecondPreimageResistant_hash_9 GDH GDH_RSR HiddenKeyCollisionResistant_hash
syn keyword cryptoverifMacro HiddenKeyCollisionResistant_hash_1 HiddenKeyCollisionResistant_hash_10
syn keyword cryptoverifMacro HiddenKeyCollisionResistant_hash_2 HiddenKeyCollisionResistant_hash_3
syn keyword cryptoverifMacro HiddenKeyCollisionResistant_hash_4 HiddenKeyCollisionResistant_hash_5
syn keyword cryptoverifMacro HiddenKeyCollisionResistant_hash_6 HiddenKeyCollisionResistant_hash_7
syn keyword cryptoverifMacro HiddenKeyCollisionResistant_hash_8 HiddenKeyCollisionResistant_hash_9
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash HiddenKeyPreimageResistant_hash_1
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_10 HiddenKeyPreimageResistant_hash_2
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_3 HiddenKeyPreimageResistant_hash_4
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_5 HiddenKeyPreimageResistant_hash_6
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_7 HiddenKeyPreimageResistant_hash_8
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_9 HiddenKeyPreimageResistant_hash_all_args
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_1
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_10
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_2
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_3
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_4
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_5
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_6
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_7
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_8
syn keyword cryptoverifMacro HiddenKeyPreimageResistant_hash_all_args_9 HiddenKeySecondPreimageResistant_hash
syn keyword cryptoverifMacro HiddenKeySecondPreimageResistant_hash_1 HiddenKeySecondPreimageResistant_hash_10
syn keyword cryptoverifMacro HiddenKeySecondPreimageResistant_hash_2 HiddenKeySecondPreimageResistant_hash_3
syn keyword cryptoverifMacro HiddenKeySecondPreimageResistant_hash_4 HiddenKeySecondPreimageResistant_hash_5
syn keyword cryptoverifMacro HiddenKeySecondPreimageResistant_hash_6 HiddenKeySecondPreimageResistant_hash_7
syn keyword cryptoverifMacro HiddenKeySecondPreimageResistant_hash_8 HiddenKeySecondPreimageResistant_hash_9
syn keyword cryptoverifMacro ICM_cipher IND_CCA2_INT_PTXT_sym_enc IND_CCA2_INT_PTXT_sym_enc_all_args
syn keyword cryptoverifMacro IND_CCA2_public_key_enc IND_CCA2_public_key_enc_all_args IND_CCA2_sym_enc
syn keyword cryptoverifMacro IND_CCA2_sym_enc_all_args IND_CPA_INT_CTXT_sym_enc
syn keyword cryptoverifMacro IND_CPA_INT_CTXT_sym_enc_all_args IND_CPA_INT_CTXT_sym_enc_nonce
syn keyword cryptoverifMacro IND_CPA_INT_CTXT_sym_enc_nonce_all_args IND_CPA_sym_enc IND_CPA_sym_enc_all_args
syn keyword cryptoverifMacro IND_CPA_sym_enc_nonce IND_CPA_sym_enc_nonce_all_args
syn keyword cryptoverifMacro INDdollar_CPA_INT_CTXT_sym_enc INDdollar_CPA_INT_CTXT_sym_enc_all_args
syn keyword cryptoverifMacro INDdollar_CPA_INT_CTXT_sym_enc_nonce INDdollar_CPA_sym_enc
syn keyword cryptoverifMacro INDdollar_CPA_sym_enc_all_args INDdollar_CPA_sym_enc_nonce INT_PTXT_sym_enc
syn keyword cryptoverifMacro INT_PTXT_sym_enc_all_args OW_trapdoor_perm OW_trapdoor_perm_RSR
syn keyword cryptoverifMacro OW_trapdoor_perm_RSR_all_args OW_trapdoor_perm_all_args PRF PRF_1 PRF_10 PRF_2
syn keyword cryptoverifMacro PRF_3 PRF_4 PRF_5 PRF_6 PRF_7 PRF_8 PRF_9 PRF_ODH1 PRF_ODH2 PRF_large
syn keyword cryptoverifMacro PRF_large_1 PRF_large_10 PRF_large_2 PRF_large_3 PRF_large_4 PRF_large_5
syn keyword cryptoverifMacro PRF_large_6 PRF_large_7 PRF_large_8 PRF_large_9 PRP_cipher
syn keyword cryptoverifMacro PreimageResistant_hash PreimageResistant_hash_1 PreimageResistant_hash_10
syn keyword cryptoverifMacro PreimageResistant_hash_2 PreimageResistant_hash_3 PreimageResistant_hash_4
syn keyword cryptoverifMacro PreimageResistant_hash_5 PreimageResistant_hash_6 PreimageResistant_hash_7
syn keyword cryptoverifMacro PreimageResistant_hash_8 PreimageResistant_hash_9
syn keyword cryptoverifMacro PreimageResistant_hash_all_args PreimageResistant_hash_all_args_1
syn keyword cryptoverifMacro PreimageResistant_hash_all_args_10 PreimageResistant_hash_all_args_2
syn keyword cryptoverifMacro PreimageResistant_hash_all_args_3 PreimageResistant_hash_all_args_4
syn keyword cryptoverifMacro PreimageResistant_hash_all_args_5 PreimageResistant_hash_all_args_6
syn keyword cryptoverifMacro PreimageResistant_hash_all_args_7 PreimageResistant_hash_all_args_8
syn keyword cryptoverifMacro PreimageResistant_hash_all_args_9 ROM_hash ROM_hash_1 ROM_hash_10 ROM_hash_2
syn keyword cryptoverifMacro ROM_hash_3 ROM_hash_4 ROM_hash_5 ROM_hash_6 ROM_hash_7 ROM_hash_8 ROM_hash_9
syn keyword cryptoverifMacro ROM_hash_large ROM_hash_large_1 ROM_hash_large_10 ROM_hash_large_2
syn keyword cryptoverifMacro ROM_hash_large_3 ROM_hash_large_4 ROM_hash_large_5 ROM_hash_large_6
syn keyword cryptoverifMacro ROM_hash_large_7 ROM_hash_large_8 ROM_hash_large_9 SPRP_cipher SUF_CMA_det_mac
syn keyword cryptoverifMacro SUF_CMA_det_mac_all_args SUF_CMA_det_signature SUF_CMA_det_signature_all_args
syn keyword cryptoverifMacro SUF_CMA_proba_mac SUF_CMA_proba_mac_all_args SUF_CMA_proba_signature
syn keyword cryptoverifMacro SUF_CMA_proba_signature_all_args SecondPreimageResistant_hash
syn keyword cryptoverifMacro SecondPreimageResistant_hash_1 SecondPreimageResistant_hash_10
syn keyword cryptoverifMacro SecondPreimageResistant_hash_2 SecondPreimageResistant_hash_3
syn keyword cryptoverifMacro SecondPreimageResistant_hash_4 SecondPreimageResistant_hash_5
syn keyword cryptoverifMacro SecondPreimageResistant_hash_6 SecondPreimageResistant_hash_7
syn keyword cryptoverifMacro SecondPreimageResistant_hash_8 SecondPreimageResistant_hash_9
syn keyword cryptoverifMacro UF_CMA_det_signature UF_CMA_det_signature_all_args UF_CMA_proba_mac
syn keyword cryptoverifMacro UF_CMA_proba_mac_all_args UF_CMA_proba_signature UF_CMA_proba_signature_all_args
syn keyword cryptoverifMacro Xor keygen random_split_1 random_split_10 random_split_2 random_split_3
syn keyword cryptoverifMacro random_split_4 random_split_5 random_split_6 random_split_7 random_split_8
syn keyword cryptoverifMacro random_split_9 set_PD_OW_trapdoor_perm set_PD_OW_trapdoor_perm_all_args
syn keyword cryptoverifMacro square_CDH square_CDH_RSR square_DDH square_DH_proba_collision square_GDH
syn keyword cryptoverifMacro square_GDH_RSR square_PRF_ODH1 square_PRF_ODH2

" To extract equivalences, edit default.cvl using this script:
" :g!/^\s*equiv\>/norm dd
" :%s/^[^(]\+(\([^()]\+\).*$/\1/
" :sort u
" :se tw=80
" :norm ggVGgw
" :%s/^/syn keyword cryptoverifEquiv /
syn keyword cryptoverifEquiv cdh collision_res ddh emkey exclude_weak_keys exp'_to_group exp_to_group gdh
syn keyword cryptoverifEquiv group_to_exp group_to_exp_strict icm icm_partial ind_cca2
syn keyword cryptoverifEquiv ind_cca2_after_int_ptxt ind_cca2_partial ind_cpa inddollar_cpa int_ctxt
syn keyword cryptoverifEquiv int_ctxt_corrupt int_ptxt int_ptxt_after_ind_cca2 int_ptxt_corrupt_partial
syn keyword cryptoverifEquiv keygen ow ow_rsr pd_ow preimage_res prf prf_odh prf_partial prp prp_partial
syn keyword cryptoverifEquiv remove_invf remove_xor rom rom_partial second_pre_res splitter sprp sprp_partial
syn keyword cryptoverifEquiv suf_cma suf_cma_corrupt suf_cma_corrupt_partial uf_cma uf_cma_corrupt
syn keyword cryptoverifEquiv uf_cma_corrupt_partial

syn keyword cryptoverifCommand SArename after after_nth all all_simplify allowed_collisions array assign
syn keyword cryptoverifCommand assume at at_nth auto before before_nth binder coll_elim crypto findcond focus
syn keyword cryptoverifCommand forget_old_games global_dep_anal guess help insert_event interactive
syn keyword cryptoverifCommand merge_arrays merge_branches move noarrayref occ out_equiv out_facts out_game
syn keyword cryptoverifCommand out_state quit random random_noarrayref remove_assign replac retart show_equiv
syn keyword cryptoverifCommand show_facts show_game show_state simplify start_from_other_end success tag
syn keyword cryptoverifCommand terms types undo use_variable useless variables

syn keyword cryptoverifConstant bottom false true
syn match cryptoverifConstant "\<0\>\|[.;]"

syn match cryptoverifOperator "[:!=/*+-]"
syn match cryptoverifOperator "&&\|||\|<>"
syn match cryptoverifOperator "==>\|<->\|<-R\?\|<=\|->\|<=>"
syn match cryptoverifDelimiter "[[\]\|(){}]"

syn region cryptoverifOption matchgroup=cryptoverifDelimiter start=/\[/ end=/]/ contains=cryptoverifOptionValue
syn keyword cryptoverifOptionValue contained all bounded compos computational cv_onesession cv_real_or_random data default exist fixed large manual noninteractive nonuniform
syn keyword cryptoverifOptionValue contained onesession passive password projection random_choices_may_be_equal real_or_random small unchanged uniform unique useful_change
syn match   cryptoverifOptionValue contained /\<\%(pest\|pcoll\)\d\+\>/
syn match   cryptoverifOptionValue contained /\<size\d\+\%(_\d\+\)\=\>/
syn match   cryptoverifOptionValue contained /\<pv\k\+\>/

syn keyword cryptoverifType bitstring bitstringbot bool

syn region cryptoverifSettings matchgroup=cryptoverifKeyword start=/\<set\>/ end=/\./ contains=cryptoverifSetting,cryptoverifSettingValue,cryptoverifOperator keepend

syn keyword cryptoverifSetting contained allowUndefinedVar autoAdvice noAdviceGlobalDepAnal autoMergeArrays
syn keyword cryptoverifSetting contained autoMergeBranches autoExpand autoMove autoRemoveAssignFindCond
syn keyword cryptoverifSetting contained autoRemoveIfFindCond autoSARename backtrackOnCrypto casesInCorresp
syn keyword cryptoverifSetting contained constantsNotTuple diffConstants elsefindAdditionalDisjunct
syn keyword cryptoverifSetting contained elsefindFactsInReplace elsefindFactsInSimplify elsefindFactsInSuccess
syn keyword cryptoverifSetting contained elsefindFactsInSuccessSimplify expandAssignXY forgetOldGames ignoreSmallTimes
syn keyword cryptoverifSetting contained improvedFactCollection inferUnique interactiveMode maxAddFactDepth
syn keyword cryptoverifSetting contained maxAdvicePossibilitiesBeginning maxAdvicePossibilitiesEnd
syn keyword cryptoverifSetting contained maxIterRemoveUselessAssign maxIterSimplif maxReplaceDepth maxTryNoVarDepth
syn keyword cryptoverifSetting contained minAutoCollElim minimalSimplifications noAdviceCrypto optimizeVars
syn keyword cryptoverifSetting contained priorityEventUnchangedRand simplifyAfterSARename uniqueBranch
syn keyword cryptoverifSetting contained uniqueBranchReorganize useEqualitiesInSimplifyingFacts
syn keyword cryptoverifSetting contained useKnownEqualitiesInCryptoTransform useKnownEqualitiesWithFunctionsInMatching

syn keyword cryptoverifSettingValue contained false large password true
syn match   cryptoverifSettingValue contained /\<pest\d\+\>/

syn region cryptoverifProbEquiv matchgroup=cryptoverifOperator start=/<=(/ end=/)=>/

syn region cryptoverifMacroDef matchgroup=cryptoverifDelimiter start=/{/ end=/}/ keepend contains=ALLBUT,cryptoverifSetting,cryptoverifSettingValue

syn keyword cryptoverifPredicate attacker ev evinj mess

syn keyword cryptoverifTodo contained TODO FIXME XXX DEBUG NOTE
syn region cryptoverifComment matchgroup=cryptoverifComment start=/(\*/ end=/\*)/ contains=cryptoverifTodo keepend
syn region cryptoverifString start=+"+ end=+"+

hi def link cryptoverifCommand      Statement
hi def link cryptoverifComment      Comment
hi def link cryptoverifConstant     Constant
hi def link cryptoverifDelimiter    Delimiter
hi def link cryptoverifEquiv        Function
hi def link cryptoverifMacro        Function
hi def link cryptoverifKeyword      Keyword
hi def link cryptoverifIdentifier   Identifier
hi def link cryptoverifOperator     Operator
hi def link cryptoverifOptionValue  StorageClass
hi def link cryptoverifPredicate    Function
hi def link cryptoverifSetting      Debug
hi def link cryptoverifSettingValue Constant
hi def link cryptoverifString       String
hi def link cryptoverifTodo         Todo
hi def link cryptoverifType         Type

let b:current_syntax = "cryptoverif"

" vim: nowrap et ts=2 sw=2
