noinst_LIBRARIES = librlgo_rlgo.a

librlgo_rlgo_a_SOURCES = \
RlAgent.cpp \
RlAgentLogger.cpp \
RlAgentPlayer.cpp \
RlAlphaBeta.cpp \
RlBinaryFeatures.cpp \
RlDirtySet.cpp \
RlEvaluator.cpp \
RlFuegoPlayout.cpp \
RlHistory.cpp \
RlLearningRule.cpp \
RlLogger.cpp \
RlMoveFilter.cpp \
RlPolicy.cpp \
RlSetup.cpp \
RlSimulator.cpp \
RlState.cpp \
RlTex.cpp \
RlTimeControl.cpp \
RlTrace.cpp \
RlTracker.cpp \
RlTrainer.cpp \
RlWeight.cpp \
RlWeightSet.cpp

noinst_HEADERS = \
RlActiveSet.h \
RlAgent.h \
RlAgentLogger.h \
RlAgentPlayer.h \
RlAlphaBeta.h \
RlBinaryFeatures.h \
RlConvert.h \
RlDirtySet.h \
RlEvaluator.h \
RlFuegoPlayout.h \
RlHistory.h \
RlLearningRule.h \
RlLogger.h \
RlMoveFilter.h \
RlPolicy.h \
RlSetup.h \
RlSimulator.h \
RlState.h \
RlTex.h \
RlTimeControl.h \
RlTrace.h \
RlTracker.h \
RlTrainer.h \
RlWeight.h \
RlWeightSet.h

librlgo_rlgo_a_CPPFLAGS = \
$(BOOST_CPPFLAGS) \
-I@fuego_dir@ \
-I@fuego_dir@/smartgame \
-I@fuego_dir@/go \
-I@fuego_dir@/gouct \
-I@top_srcdir@/utils

DISTCLEANFILES = *~
